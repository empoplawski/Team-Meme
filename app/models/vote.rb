class Vote < ApplicationRecord
  belongs_to :voter, class_name: "User"
  belongs_to :meme, polymorphic: true
  belongs_to :caption, polymorphic: true
end
