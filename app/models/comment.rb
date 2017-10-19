class Comment < ApplicationRecord
  belongs_to :commenter, class_name: "User"
  belongs_to :commentable, polymorphic: true

  validates :comment_content, presence: true, length: { minimum: 1 }
end
