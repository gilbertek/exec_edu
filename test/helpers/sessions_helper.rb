module SessionsHelper
  def sign_in_as(user)
    post login_path(email: user.email, password: user.password)
  end
end
