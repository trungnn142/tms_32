class Subject < ActiveRecord::Base
  has_many :user_subjects
  has_many :users, through: :user_subjects
  has_many :course_subjects
  has_many :courses, through: :course_subjects
  has_many :tasks, dependent: :destroy, inverse_of: :subject

  validates :name, presence: true
  validates :instruction, presence: true, length: {minimum: 100}

  accepts_nested_attributes_for :tasks, allow_destroy: true,
    reject_if: proc {|a| a[:name].blank?}

end
