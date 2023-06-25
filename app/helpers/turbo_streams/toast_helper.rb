module TurboStreams::ToastHelper
  def toast(message)
    turbo_stream_action_tag :toast, message: message
  end
  
end

Turbo::Streams::TagBuilder.prepend(TurboStreams::ToastHelper)
