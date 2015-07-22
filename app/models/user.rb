class User < ActiveRecord::Base
  enum role: [:trainee, :supervisor]

  has_many :course_users
  has_many :courses, through: :course_users
  has_many :user_subjects
  has_many :subjects, through: :user_subjects
  has_many :user_tasks
  has_many :tasks, through: :user_tasks
  has_many :activities

  validates :name, presence: true, length: {minimum: 6}
  validates :email, presence:true, length: {maximum: 255},
    format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i},
    uniqueness: {case_sensitive: false}
end
