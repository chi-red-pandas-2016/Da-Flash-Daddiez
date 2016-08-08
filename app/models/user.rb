class User < ActiveRecord::Base
 has_many :rounds
 has_many :guesses, through: :rounds
  validates :username, uniqueness: true, presence: true
  # validates :hashed_password, length: { in: 6..20 }
  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(plaintext_password)
    @password = BCrypt::Password.create(plaintext_password)
    self.hashed_password = @password
  end

  def authenticate(password)
    self.password == password
  end

end
