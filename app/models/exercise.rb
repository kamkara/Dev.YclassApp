class Exercise < ApplicationRecord
  belongs_to :user
  belongs_to :course

  has_many :questions, dependent: :destroy
    accepts_nested_attributes_for :questions, allow_destroy: true


    extend FriendlyId
    friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    name_changed?
  end
end
