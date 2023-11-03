class User < ApplicationRecord

    has_secure_password
  
    validates :email, presence: true, uniqueness: true, length: {in: 3..150}, format: {with: URI::MailTo::EMAIL_REGEXP }
    validates :session_token, presence: true, uniqueness: true
    validates :password, length: {in: 8..30 }, allow_nil: true, format: {with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}\z/, message: "Password requirements not met"}
  
    has_many :homes,
    primary_key: :id,
    foreign_key: :seller_id,
    class_name: :Home
  
    has_many :searches,
    primary_key: :id,
    foreign_key: :searcher_id,
    class_name: :Search
  
    has_many :likes,
    primary_key: :id,
    foreign_key: :liker_id,
    class_name: :Like
  
    has_many :liked_homes,
    through: :likes,
    source: :home
   
    before_validation :ensure_session_token
  
    def self.find_by_credentials(email, password)
      @user = User.find_by(email: email)
      if @user&.authenticate(password)
        return @user
      else
        return nil
      end
    end
  
    def reset_session_token!
        new_session_token = generate_unique_session_token
        self.update!(session_token: new_session_token)
        return new_session_token
    end
  
    private
  
    def generate_unique_session_token
      loop do
        session_token = SecureRandom.urlsafe_base64
        unless User.exists?(session_token: session_token)
          return session_token
        end
      end
    end
  
    def ensure_session_token
      if !self.session_token 
        self.session_token = generate_unique_session_token
      end
    end
end
  