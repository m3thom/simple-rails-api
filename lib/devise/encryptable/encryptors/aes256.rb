require 'aes'

# This code based on: https://github.com/chicks/devise_aes_encryptable/blob/master/lib/encryptors/aes256.rb
module Devise
  module Encryptable
    module Encryptors
      # = AES
      # Uses the AES algorithm to encrypt passwords.
      class Aes256 < Base
        # Returns a Base64 encrypted password where pepper is used for the key,
        # and the initialization_vector is randomly generated and prepended onto
        # encoded ciphertext
        def self.digest(password, _stretches, salt, pepper)
          AES.encrypt("#{password}", pepper, { iv: salt }) if password
        end

        # alias :encrypt :digest
        # Returns a base64 encoded salt
        def self.salt(_stretches = 0)
          AES.iv(:base_64)
        end

        # Returns the plaintext password where pepper is used for the key,
        # and the initialization_vector is read from the Base64 encoded ciphertext
        def self.decrypt(encrypted_password, pepper)
          AES.decrypt(encrypted_password, pepper)
        end
      end
    end
  end
end
