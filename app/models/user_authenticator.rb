class UserAuthenticator
  prepend SimpleCommand

  attr_reader :auth_token, :email, :password, :user

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    @auth_token = UserApi.authenticate(params: { email: email, password: password })
    user_params = UserApi.identify(params: { token: auth_token })

    @user = User.first_or_create!(user_params.merge(email: email, password: password, password_confirmation: password)) do |u|
      u.update(auth_token: auth_token)
    end
  rescue ExecOnlineApiError::ApiAuthenticationError => e
    Rails.logger.error "#{e.message}"
    errors.add(:user, 'Unidentified user. please register to continue')
    return
  end
end
