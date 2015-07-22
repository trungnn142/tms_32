class Subject < ActiveRecord::Base
  has_many :user_subjects
  has_many :users, through: :user_subjects
  has_many :course_subjects
  has_many :courses, through: :course_subjects
  has_many :tasks

  validates :name, presence: true
  validates :instruction, presence: true, length: {minimum: 100}
end
