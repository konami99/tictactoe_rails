class Tictactoeboard < ApplicationRecord
  #after_update_commit -> { broadcast_replace_to channel }

  def winner
    if cell_1.present? && cell_2.present? && cell_3.present? && cell_1 == cell_2 && cell_2 == cell_3
      cell_1
    elsif cell_4.present? && cell_5.present? && cell_6.present? && cell_4 == cell_5 && cell_5 == cell_6
      cell_4
    elsif cell_7.present? && cell_8.present? && cell_9.present? && cell_7 == cell_8 && cell_8 == cell_9
      cell_7
    elsif cell_1.present? && cell_4.present? && cell_7.present? && cell_1 == cell_4 && cell_4 == cell_7
      cell_1
    elsif cell_2.present? && cell_5.present? && cell_8.present? && cell_2 == cell_5 && cell_5 == cell_8
      cell_2
    elsif cell_3.present? && cell_6.present? && cell_9.present? && cell_3 == cell_6 && cell_6 == cell_9
      cell_3
    elsif cell_1.present? && cell_5.present? && cell_9.present? && cell_1 == cell_5 && cell_5 == cell_9
      cell_1
    elsif cell_3.present? && cell_5.present? && cell_7.present? && cell_3 == cell_5 && cell_5 == cell_7
      cell_3
    end
  end

  def whose_turn_next
    return if winner

    return 'player_1' if circles_count.zero? && crosses_count.zero?
    return 'player_2' if circles_count > crosses_count
    'player_1'
  end
end