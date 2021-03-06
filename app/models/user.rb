class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Allowlist

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :encryptable,
         :jwt_authenticatable,
         jwt_revocation_strategy: self

  def decrypted_password
    Devise::Encryptable::Encryptors::Aes256.decrypt(encrypted_password, Devise.pepper)
  end

  def on_jwt_dispatch(token, payload)
    super
    allowlisted_jwts.where.not(jti: payload["jti"]).destroy_all
  end
end
