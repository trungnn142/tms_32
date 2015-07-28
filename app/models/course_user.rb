class CourseUser < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

  validates :course_id, uniqueness: {scope: :user_id}

  scope :has_user, -> user {find_by user_id: user.id}
  scope :trainees, -> {joins(:user).where("users.role = ?",
    User.roles[:trainee])}
  scope :supervisors, -> {joins(:user).where("users.role = ?",
    User.roles[:supervisor])}

  after_save :add_user_to_subjects
  after_destroy :destroy_user_subjects

  private
  def add_user_to_subjects
    course.course_subjects.each do |course_subject|
      user.user_subjects.create subject_id: course_subject.subject_id,
        course_id: course_id
    end
  end

  def destroy_user_subjects
    course.user_subjects.filter_by_user(user_id).delete_all
  end
end
