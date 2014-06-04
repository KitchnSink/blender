class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :add_player

  embeds_one :user_profile
  embeds_one :player

  ## Database authenticatable
  field :email,               type: String, default: ""
  field :encrypted_password,  type: String, default: ""
  field :provider,            type: String, default: ""
  field :uid,                 type: String, default: ""
  field :role,                type: String, default: ""

  attr_readonly :status, :gamedata, :experience, :update_gamedata

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  validates :email, presence: true, uniqueness: true

  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time

  def anonymous?
    false
  end

  def authenticated?
    true
  end

  def admin?
    self.role == 'admin'
  end

  def author?
    self.role == 'author'
  end

  def editor?
    self.role == 'editor'
  end

  def status
    self.player.status
  end

  def gamedata
    self.player.gamedata
  end

  def update_gamedata lesson
    self.player.update_gamedata lesson
  end

  def experience
    self.player.experience
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = "#{auth.id}-CHANGE@twitter.user.com"
    end
  end

  def self.new_with_session(params, session)
    if session['devise.user_attributes']
      new(session['devise.user_attributes'], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

  private

    def add_player
      self.player = Player.new
    end

end
