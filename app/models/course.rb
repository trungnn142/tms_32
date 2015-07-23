class Course < ActiveRecord::Base
  has_many :course_users
  has_many :users, through: :course_users
  has_many :course_subjects
  has_many :subjects, through: :course_subjects
  has_many :user_tasks

  validates :name, presence: true
  validates :description, presence: true, length: {minimum: 100}
  validate :start_date_cannot_be_greater_than_end_date

  def start_date_cannot_be_greater_than_end_date
    if start_date > end_date
      errors.add(:start_date, t("courses.create.date_invalid"))
    end
  end
end
