class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  has_many :trophies
  has_many :pomodoros

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid, :first_name, :last_name
  # attr_accessible :title, :body
  
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
  
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(  first_name: auth.extra.raw_info.first_name,
                           last_name: auth.extra.raw_info.last_name,
                           provider: auth.provider,
                           uid: auth.uid,
                           email: auth.info.email,
                           password: Devise.friendly_token[0,20]
                         )
    end
    user
  end

  # def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
  #   user = User.where(:provider => auth.provider, :uid => auth.uid).first
  #   unless user
  #     user = User.create(  first_name: auth.extra.raw_info.name,
  #                          provider: auth.provider,
  #                          uid: auth.uid,
  #                          password: Devise.friendly_token[0,20]
  #                        )
  #   end
  #   user
  # end
  # 
  # def trophy_score
  #   trophies.inject(0) {|memo, trophy| memo += trophy.value }
  # end
  
  def trophy_score
    trophies.inject(0) {|memo, trophy| memo += trophy.value }
  end

  def current_pomodoro
    pomodoros.last
  end
  
  def has_in_progress_pomodoro?
    self.current_pomodoro && self.current_pomodoro.in_progress?
  end

  def has_waiting_pomodoro?
    self.current_pomodoro && self.current_pomodoro.waiting?
  end
  
  def current_pomodoro_cycle
    self.current_pomodoro.current_cycle
  end

  def completed_pomodoros
    self.pomodoros.where(:workflow_state => "complete")
  end

  def failed_pomodoros
    self.pomodoros.where(:workflow_state => "failed")
  end

  def completed_cycles
    cycles = []
    self.pomodoros.each do |pomodoro|
      cycles = cycles | pomodoro.pomodoro_cycles.where(:workflow_state => "complete")
    end

    cycles
  end
end
