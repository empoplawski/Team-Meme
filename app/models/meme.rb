class Meme < ApplicationRecord
  belongs_to :memer, class_name: "User"
  has_many :captions
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
end
