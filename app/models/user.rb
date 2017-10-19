class User < ApplicationRecord
  has_many :memes, foreign_key: :memer_id
  has_many :captions
  has_many :comments, foreign_key: :commenter_id
  has_many :votes, foreign_key: :voter_id

  validate :validate_password

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(plain_text_password)
    @raw_password = plain_text_password
    @password = BCrypt::Password.create(plain_text_password)
    self.hashed_password = @password
  end

  def authenticate(password)
    self.password == password
  end

  def validate_password
    if @raw_password.nil?
      errors.add(:password, "can't be blank!")
    elsif @raw_password.length < 6
      errors.add(:password, "must be longer than 6 characters!")
    end

  end

end
