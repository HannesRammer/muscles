# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def muscle_pics(muscles, effect, strength = 3)
    x=[]
    muscles.each do |muscle|
      #x.push(tag(:div, class: "multi_pic #{muscle.clean_name}#{"_#{effect}" unless effect.blank?}", style:"opacity:#{0.25 * strength};position:absolute;"))
      x << "<div class='multi_pic #{muscle.clean_name}#{"_#{effect}" unless effect.blank?}' style='opacity:#{0.25 * strength};position:absolute;'></div>"
      #x << image_tag("/assets/muscles/#{muscle.picture_id}_#{muscle.clean_name}#{"_#{effect}" if !effect.blank?}.png", :style=>"opacity:#{0.25*strength}", :id=>"#{muscle.clean_name}_#{effect}", :class=>"multi_pic")
    end
  x.join.html_safe
  end

  def user_muscle_pics(muscles, effect, strength = 3)

    x=[]
    muscles.each do |muscle|

      #x << image_tag("/images/muscles/#{muscle.picture_id}_#{muscle.clean_name}#{"_#{effect}" if !effect.blank?}.png", :class=>"multi_pic2", :style=>"opacity:#{0.25*strength}")
      #x << tag("div", class: "multi_pic2 #{muscle.clean_name}#{"_#{effect}" unless effect.blank?}", style:"opacity:#{0.25 * strength};position:absolute;")
      x << "<div class='multi_pic2 #{muscle.clean_name}#{"_#{effect}" unless effect.blank?}' style='opacity:#{0.25 * strength};position:absolute;'></div>"
    end
    x.join.html_safe

  end

  def clean_name(name)
    name.downcase.gsub("ß", "ss").gsub(" ", "_").gsub('ä', 'ae').gsub('ö', 'oe').gsub('ü', 'ue').gsub('Ä', 'ae')
  end

  def normal_name(name)
    name.downcase.gsub('ss', 'ß').gsub('_', ' ').gsub('ae', 'ä').gsub('oe', 'ö').gsub('ue', 'ü').gsub('ae','Ä')
  end

  def vertical_text(text)
    text = clean_name(text)
    nt = ''
    i = text.length
    i.times do |it|
      nt << "#{text[(it)..(it)]}<br/>"
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

    [x,y,z]

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
      flash[:error] = "You must first log in or sign up before accessing this page."
      store_target_location
      redirect_to login
    end
  end

  def admin_required
    unless is_admin?
      flash[:error] = "You must first log in as admin"
      store_target_location
      redirect_to login
    end
  end

  def is_admin?
    current_user&.admin || false
  end


  def redirect_to_target_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

  private

  def store_target_location
    session[:return_to] = request.request_uri
  end
end
