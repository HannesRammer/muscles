class ApplicationMailer < ActionMailer::Base
  helper :mailer
  default from: "from@example.com"

  layout "mailer"

  def welcome_email(email)
    @user = User.find_by(email: email[:email])
    @url  = 'http://localhost:3000/'
    mail(to: @user.email, subject: 'Welcome to instaFit')
  end

    def reset_pw_email(email)

      @user = User.find_by(email: email[:email])
      @url  = "http://localhost:3000/reset_pw?token=#{@user.reset_password_token}\&email=#{@user.email}".html_safe
      mail(to: @user.email, subject: 'forgot password')
    end
  end
