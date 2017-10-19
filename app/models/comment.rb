class Comment < ApplicationRecord
  belongs_to :commenter, class_name: "User"
  belongs_to :meme, polymorphic: :true
  belongs_to :caption, polymorphic: :true
end
