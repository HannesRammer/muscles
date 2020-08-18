class ApplicationMailer < ActionMailer::Base
  helper :mailer
  default from: "app@muscles.a2hosted.com"

  layout "mailer"

  def welcome_email(email)
    @user = User.find_by(email: email[:email])
    @url = 'https://free-workouts.com/'
    mail(to: @user.email, subject: 'Welcome to free-workouts.com')
  end

  def reset_pw_email(email)

    @user = User.find_by(email: email[:email])
    @url = "https://free-workouts.com/reset_pw?token=#{@user.reset_password_token}\&email=#{@user.email}".html_safe
    mail(to: @user.email, subject: 'forgot password')
  end
end
