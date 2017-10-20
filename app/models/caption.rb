class Caption < ApplicationRecord
  belongs_to :user
  belongs_to :meme
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  validates :caption_content, presence: true, length: { minimum: 1 }

  def total_votes
    vote_total = 0
    self.votes.each do |vote|
      vote_total += vote.value
    end
  vote_total
  end

end
