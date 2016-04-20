class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :recoverable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable,
         authentication_keys: [:username]

  has_one :checklist

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup

    if conditions.has_key?(:username)
      where(conditions.to_hash).first
    end
  end
end
