module TurboStreams::ReloadHelper
  def reload
    turbo_stream_action_tag :reload
  end
  
end

Turbo::Streams::TagBuilder.prepend(TurboStreams::ReloadHelper)
