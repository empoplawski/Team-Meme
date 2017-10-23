class Meme < ApplicationRecord
  belongs_to :memer, class_name: "User"
  has_many :captions
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable

  validates :photo, presence: true
  validates :memer_id, presence: true

  def total_votes
    vote_total = 0
    self.votes.each do |vote|
      vote_total += vote.value
    end
  vote_total
  end

  def order_captions
    self.captions.order('favorite DESC, created_at')
  end

  def more_than_one_favorite?
    self.captions.select { |caption| caption.favorite == true }.length == 1
  end

  def unfavorite_all_captions
    self.captions.each do |caption|
      caption.favorite = false
      caption.save
    end
  end

end
