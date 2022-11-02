class Course < ApplicationRecord
  belongs_to :user
   has_many :exercises, class_name: "Exercise", foreign_key: "course_id", dependent: :destroy
  has_rich_text :content

  extend FriendlyId
    friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end  
end
