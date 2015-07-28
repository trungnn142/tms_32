class CourseUser < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

  validates :course_id, uniqueness: {scope: :user_id}

  scope :has_user, -> user {find_by user_id: user.id}
  scope :trainees, -> {joins(:user).where("users.role = ?",
    User.roles[:trainee])}
  scope :supervisors, -> {joins(:user).where("users.role = ?",
    User.roles[:supervisor])}
end
