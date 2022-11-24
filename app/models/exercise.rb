class Exercise < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions, allow_destroy: true
  has_many :results, dependent: :destroy

  ########## COMPLET EXERCISE ##############

  def completed_by(user)
    results.any? {|result| result.user == user }
  end

  ########### user grade  #########
  def user_grade(user)
    results.where(user_id: user).first.grade()
  end
  ############ Result ###################
  def build_result
    result = self.results.build()
    self.questions.each {|exercise| result.answered_questions.build(question: exercise)}
    return result
  end

  #############  Scopes ##############
  scope :unlock_correct, -> { where(" == true")}
  scope :feed_exercise, -> { order(created_at: :desc)}
  

    extend FriendlyId
    friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    name_changed?
  end
end
