# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper


  def muscle_pics(muscles, effect, strength = 2)
    x = []
    muscles.each do |muscle|
      x << "<div class='multi_pic #{muscle.clean_name}#{"_#{effect}" unless effect.blank?}' style='opacity:#{0.1 * strength};position:absolute;'></div>"
    end
    x.join.html_safe
  end

  def user_muscle_pics(muscles, effect, strength = 2, class_name)

    x = []
    muscles.each do |muscle|
      x << "<div class='#{class_name} #{muscle.clean_name}#{"_#{effect}" unless effect.blank?}' style='opacity:#{0.1 * strength};position:absolute;'></div>"
    end
    x.join.html_safe

  end

  def user_muscle_pics_trainingsplan_list(muscles, effect, strength = 2)

    x = []
    muscles.each do |muscle|

      #x << tag("div", class: "multi_pic2 #{muscle.clean_name}#{"_#{effect}" unless effect.blank?}", style:"opacity:#{0.25 * strength};position:absolute;")
      x << "<div class='multi_pic_minffi2 #{muscle.clean_name}#{"_#{effect}" unless effect.blank?}' style='opacity:#{0.1 * strength};position: absolute;
    top: 0;
    left: 0;'></div>"
    end
    x.join.html_safe

  end

  def clean_name(name)
    if name == nil
      ""
    else
      name.downcase.gsub("ß", "ss").gsub(" ", "_").gsub("ä", "ae").gsub("ö", "oe").gsub("ü", "ue").gsub("Ä", "ae")
    end

  end

  def normal_name(name)
    name.downcase.gsub("ss", "ß").gsub("_", " ").gsub("ae", "ä").gsub("oe", "ö").gsub("ue", "ü").gsub("ae", "Ä")
  end

  def vertical_text(text)
    text = clean_name(text)
    nt = ""
    i = text.length
    i.times do |it|
      nt << "#{text[(it)..(it)]}"
    end
    nt.html_safe
  end

  def hex_to_rgb(hex)

    a = give_dec(hex[0..1])
    b = give_dec(hex[1..2])

    c = give_dec(hex[2..3])
    d = give_dec(hex[3..4])
    e = give_dec(hex[4..5])
    f = give_dec(hex[5..6])

    x = (a * 16) + b
    y = (c * 16) + d
    z = (e * 16) + f

    [x, y, z]

  end

  def rgba_to_list(rgba)
    rgba.split("(")[1].split(")")[0].split(",")
  end

  def give_dec(hex)
    value = 0
    if hex == "A"
      value = 10
    elsif hex == "B"
      value = 11
    elsif hex == "C"
      value = 12
    elsif hex == "D"
      value = 13
    elsif hex == "E"
      value = 14
    elsif hex == "F"
      value = 15
    else
      value = hex.to_i
    end
    value
  end


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user
  end

  def login_required
    unless logged_in?
      flash[:notice] = "You must first log in or sign up before accessing this page."
      store_target_location
      redirect_to login
    end
  end

  def admin_required
    unless is_admin?
      flash[:notice] = "You must first log in as admin"
      store_target_location
      redirect_to login
    end
  end

  def is_admin?
    current_user&.admin || false
  end

  def is_exercise_owner_for(exercise_id)
    @current_user && UserToExercise.find_by_user_id_and_exercise_id(@current_user.id, exercise_id) || false
  end

  def redirect_to_target_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  def creator_of_trainingsplan
    ttu = current_user && TrainingsplanToUser.find_by(trainingsplan_id: params[:trainingsplan_id], user_id: @current_user.id)

  end

  def is_unit_duration(unit)
    if unit == "duration"
      true
    else
      false
    end
  end

  def is_unit_reps(unit)
    if unit == "reps"
      true
    else
      false
    end
  end

  def follow_button (user)
    if current_user.following?(user)
      button_to "Unfollow", unfollow_user_path

    else
      button_to "Follow", follow_user_path
    end
  end

  private

  def store_target_location
    session[:return_to] = request.request_uri
  end
end
