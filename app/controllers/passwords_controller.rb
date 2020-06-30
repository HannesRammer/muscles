class PasswordsController < ApplicationController

  protect_from_forgery with: :null_session

  def forgot
    if params[:email].blank? # check if email is present
      return render json: {error: 'Email not present'}
    end

    user = User.find_by(email: params[:email]) # if present find user by email

    respond_to do |format|
      if user.present?
          user.generate_password_token! #generate pass token
          # SlEND EMAIL HERE
          ApplicationMailer.with(user: user).reset_pw_email(user.email).deliver_now
          format.html { redirect_to login_path, notice: "Password reset email was send to #{user.email}" }
          format.json { render :show, status: :created, location: @user }
      else
        format.html { redirect_to forgot_pw_path, notice: "pw link not send. pls try again!" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end

  def reset
    token = params[:token].to_s

    if params[:email].blank?
      return render json: {error: 'Token not present'}
    end

    user = User.find_by(reset_password_token: token)


    respond_to do |format|
      if user.present? && user.password_token_valid?
        user.generate_password_token! #generate pass token
        format.html { redirect_to login_path, notice: "Password changed for #{user.email}!" }
      else
        format.html { redirect_to reset_pw_path, notice: "pw link not send. pls try again!" }
      end
    end

  end

  def forgot_pw

    x=0
  end
  def reset_pw

    x=0
  end

end
