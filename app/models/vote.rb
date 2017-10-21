class Vote < ApplicationRecord
  belongs_to :voter, class_name: "User"
  belongs_to :voteable, polymorphic: true

    # validates_uniqueness_of :voter, uniqueness: { :scope => :voteable, message: "Ya can't vote twice!" }

  validates :voter, { uniqueness: { scope: :voteable } }

end
