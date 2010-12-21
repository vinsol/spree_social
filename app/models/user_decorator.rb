User.class_eval do
  has_many :user_authentications

  # Associates user to auth source
  def associate_auth(source)
    return if user_authentications.where(:provider => source['provider'], :uid => source['uid'].to_s).count > 0
    self.user_authentications.create!(:provider => source['provider'], :uid => source['uid'], :nickname => source["user_info"]['nickname'])
  end
  
  def is_anonymous?
    !self.email.match(/\b([a-zA-Z0-9._%+-]+)@(example.net)/).nil?
  end

  # Thx Ryan
  def password_required?
    (user_authentications.empty? || !password.blank?) && super
  end

end