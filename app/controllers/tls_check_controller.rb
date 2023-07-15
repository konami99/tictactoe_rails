class TlsCheckController < ActionController::Base
  def check
    requested_domain = params[:domain]

    return head :ok if requested_domain&.end_with?('.dev') || requested_domain&.end_with?('.xyz')

    head :forbidden
  end
end
