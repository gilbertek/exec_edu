class CourseApi
  class << self
    include ExecOnlineApiConcern

    def by_id(params)
      headers = build_identity_headers(params)
      response = get_course(options: params, headers: headers)

      if response.success?
        response.parsed_response
      else
        fail ExecOnlineApiError::ApiCallFailedError
      end
    end

    def by_user(params)
      headers = build_identity_headers(params)
      response = get_courses_by_user(options: {}, headers: headers)

      if response.success?
        response.parsed_response
      else
        fail ExecOnlineApiError::ApiCallFailedError
      end
    end

    private

    def get_courses_by_user(options:, headers:)
      HTTParty.get(
        EXECONLINE_API_URL + '/v1/user/courses.json',
        body: options.to_json,
        headers: headers
      )
    end

    def get_course(options:, headers:)
      HTTParty.get(
        EXECONLINE_API_URL + "/v1/courses/#{options.fetch(:id)}.json",
        body: options.to_json,
        headers: headers
      )
    end
  end
end
