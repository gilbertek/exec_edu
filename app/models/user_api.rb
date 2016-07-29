class UserApi
  class << self
    EXECONLINE_API_URL  = Rails.application.secrets.execonline_api_url
    EXECONLINE_PARTNER_KEY = Rails.application.secrets.insights_auth_key

    def token

    end

    private
  end
end


module ExecOnlineApiError
  class ApiCredentialsNotSetError < StandardError; end
  class ApiUrlNotSetError < StandardError; end
  class ApiAuthenticationError < StandardError; end
  class ApiCallFailedError < StandardError; end
  class NoMatchesFoundError < StandardError; end
end
