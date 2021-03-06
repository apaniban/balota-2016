class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :recoverable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable,
         authentication_keys: [:username]

  devise :omniauthable, omniauth_providers: [:facebook]

  has_one :checklist

  validates :username, uniqueness: { case_sensitive: false }, if: Proc.new { |user| user.username.present? }
  validates :username, presence: true, if: Proc.new { |user| !user.registered_using_omniauth? }
  validates :password, presence: true, if: Proc.new { |user| !user.registered_using_omniauth? }
  validates_confirmation_of :password, if: Proc.new { |user| !user.registered_using_omniauth? }

  after_create :create_checklist

  def registered_using_omniauth?
    self.provider.present? && self.uid.present?
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup

    if conditions.has_key?(:username)
      conditions[:username].downcase!
      where(["lower(username) = lower(:value)", { value: conditions[:username] }]).first
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
    end
  end
end
