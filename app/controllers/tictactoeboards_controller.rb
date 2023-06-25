class TictactoeboardsController < ApplicationController
  include Turbo::Streams::ActionHelper

  before_action :initialise_board, only: :index

  def index
    #@tictactoeboard = Tictactoeboard.find(1)
  end

  def click
    request_body = JSON.parse(request.body.read)
    cell = request_body['cell']
    player = cookies['player_1'].present? ? 'player_1' : 'player_2'
    channel = cookies['channel']
    @tictactoeboard = Tictactoeboard.find_by(channel: channel)

    return if @tictactoeboard.send(cell)
    return if @tictactoeboard.winner
    return unless @tictactoeboard.whose_turn_next == player

    if player == 'player_1'
      @tictactoeboard.update("#{cell}": 'circle', circles_count: @tictactoeboard.circles_count + 1)
    elsif player == 'player_2'
      @tictactoeboard.update("#{cell}": 'cross', crosses_count: @tictactoeboard.crosses_count + 1)
    end

    @tictactoeboard.broadcast_replace_to(channel)
  end

  def reset
    cookies.delete(:player_1)
    cookies.delete(:player_2)
    channel = cookies['channel']
    cookies.delete(:channel)

    tictactoeboard = Tictactoeboard.destroy_by(channel: channel)

    ActionCable.server.broadcast(channel, turbo_stream.toast('Game has been reset'))
    sleep 2
    ActionCable.server.broadcast(channel, turbo_stream.reload)
  end

  def join

  end

  def leave
    cookies.delete(:player_1)
    cookies.delete(:player_2)
    channel = cookies['channel']
    cookies.delete(:channel)
    tictactoeboard = Tictactoeboard.find_by(channel: channel)
    if tictactoeboard.winner
      tictactoeboard.destroy
    else
      tictactoeboard.update(player_2: false)
    end

    ActionCable.server.broadcast(channel, turbo_stream.toast('Player 2 has left the game'))
    sleep 2
    ActionCable.server.broadcast(channel, turbo_stream.reload)
  end

  def join_team
    cookies.delete(:player_1)
    cookies.delete(:player_2)
    cookies['channel'] = params[:channel]

    respond_to do |format|
      format.html { redirect_to action: :index }
      format.turbo_stream {
        ActionCable.server.broadcast(params[:channel], turbo_stream.toast('Player 2 has joined the game'))
        sleep 2
        ActionCable.server.broadcast(params[:channel], turbo_stream.reload)
        redirect_to action: :index
      }
    end
  end

  private

  def initialise_board
    player_1 = cookies['player_1']
    player_2 = cookies['player_2']
    channel = cookies['channel']

    @channel = channel ? channel : SecureRandom.alphanumeric(4)
    
    @tictactoeboard = Tictactoeboard.find_by(channel: @channel)
    unless @tictactoeboard
      @tictactoeboard = Tictactoeboard.create(channel: @channel)
      player_1 = nil
      player_2 = nil
    end
    
    if player_1.blank? && player_2.blank?
      if @tictactoeboard.player_1.blank?
        cookies['player_1'] = true
        cookies.delete(:player_2)
        cookies['channel'] = @channel
        @tictactoeboard.update(player_1: true)
      elsif @tictactoeboard.player_2.blank?
        cookies.delete(:player_1)
        cookies['player_2'] = true
        cookies['channel'] = @channel
        @tictactoeboard.update(player_2: true)
      end
    end
  end
end
