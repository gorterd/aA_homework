class User < ApplicationRecord

    attr_reader :password

    validates :username, :session_token, presence:true
    validates :password_digest, presence: {message: 'Password can\'t be blank'}
    validates :password, length: {minimum: 8, allow_nil: true}

    before_validation :ensure_session_token

    def self.find_by_credentials(username, password)
        matching_user = self.find_by(username: username)
        BCrypt::Password.new(matching_user.password_digest).is_password?(password) ? matching_user : nil
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end

    def reset_session_token!
        loop do
            self.session_token = self.class.generate_session_token 
            break unless self.class.exists?(session_token: self.session_token)
        end

        self.save!
    end

    def ensure_session_token
        reset_session_token! if self.session_token.nil?
    end

    def password=(pw)
        @password = pw
        self.password_digest = BCrypt::Password.create(pw)
    end

end

