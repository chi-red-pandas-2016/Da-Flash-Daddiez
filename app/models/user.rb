class User < ActiveRecord::Base
 has_many :rounds
 has_many :guesses, through: :rounds
  validates :username, uniqueness: true, presence: true
  validates :hashed_password, presence: true

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(plaintext_password)
    @password = BCrypt::Password.create(plaintext_password)
    self.hashed_password = @password
  end

  def authenticate(user_entered_password)
    self.password == user_entered_password
  end

end
