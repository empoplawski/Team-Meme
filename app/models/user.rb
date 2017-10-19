class User < ApplicationRecord
  has_many :memes, foreign_key: :memer_id
  has_many :captions
  has_many :comments, foreign_key: :commenter_id
  has_many :votes, foreign_key: :voter_id
end
