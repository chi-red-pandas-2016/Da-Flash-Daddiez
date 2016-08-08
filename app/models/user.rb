class User < ActiveRecord::Base
 has_many :rounds
 has_many :guesses, through: :rounds
  validates :username, uniqueness: true, presence: true
  validates :hashed_password, presence: true
  validate :check_pass



  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(plaintext_password)
    @plaintext = plaintext_password
    @password = BCrypt::Password.create(plaintext_password)
    self.hashed_password = @password
  end



  def authenticate(user_entered_password)
    self.password == user_entered_password
  end

  def check_pass
    if !(@plaintext.length > 1)
      errors.add(:hashed_password, "Password must be longer.")
    end
  end

end
