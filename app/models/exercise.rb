class Exercise < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_rich_text :annonce
end
