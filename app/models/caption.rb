class Caption < ApplicationRecord
  belongs_to :user
  belongs_to :meme
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  validates :caption_content, presence: true, length: { minimum: 1 }
end
