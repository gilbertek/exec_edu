class UserApi
  class << self
    EXECONLINE_API_URL       = Rails.application.secrets.execonline_api_url
    EXECONLINE_PARTNER_TOKEN = Rails.application.secrets.execonline_partner_token

    def authenticate(params:)
      headers = build_auth_headers(params)
      response = request(body: {}, headers: headers)

      if response.success?
        response.parsed_response["token"]
      else
        fail ExecOnlineApiError::ApiAuthenticationError
      end
    end

    private

    def build_auth_headers(params)
      {}.tap do |headers|
        headers['X-Partner-Token']  = EXECONLINE_PARTNER_TOKEN
        headers['X-User-Email']     = params[:email]
        headers['X-User-Password']  = params[:password]
      end
    end

    def request(body:, headers:)
      fail ExecOnlineApiError::ApiCredentialsNotSetError unless EXECONLINE_PARTNER_TOKEN.present?
      fail ExecOnlineApiError::ApiUrlNotSetError unless EXECONLINE_API_URL.present?

      HTTParty.post(
        EXECONLINE_API_URL + '/v1/tokens.json',
        body: body.to_json,
        headers: headers
      )
    end
  end
end

module ExecOnlineApiError
  class ApiUrlNotSetError < StandardError; end
  class ApiCredentialsNotSetError < StandardError; end
  class ApiAuthenticationError < StandardError; end
  class ApiCallFailedError < StandardError; end
end
