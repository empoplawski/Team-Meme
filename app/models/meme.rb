class Meme < ApplicationRecord
  belongs_to :memer, class_name: "User"
  has_many :captions
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  validates :photo, presence: true
  validates :memer_id, presence: true

end
