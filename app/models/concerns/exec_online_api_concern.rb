module ExecOnlineApiConcern
  extend ActiveSupport::Concern

  EXECONLINE_API_URL       = Rails.application.secrets.execonline_api_url
  EXECONLINE_PARTNER_TOKEN = Rails.application.secrets.execonline_partner_token
  EXECONLINE_API_VERSION   = 'v1'.freeze

  def build_identity_headers(params)
    {}.tap do |headers|
      headers['X-Partner-Token']  = EXECONLINE_PARTNER_TOKEN
      headers['X-User-Token']     = params[:token]
    end
  end
end
