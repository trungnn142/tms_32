class CourseUser < ActiveRecord::Base
  include Loggable
  belongs_to :course
  belongs_to :user

  validates :course_id, uniqueness: {scope: :user_id}

  scope :has_user, -> user {find_by user_id: user.id}
  scope :trainees, -> {joins(:user).where("users.role = ?",
    User.roles[:trainee])}
  scope :supervisors, -> {joins(:user).where("users.role = ?",
    User.roles[:supervisor])}

  after_save :add_user_to_subjects, :create_course_assignment_log
  after_destroy :destroy_user_subjects, :create_course_removal_log

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

  def create_course_assignment_log
    create_activity_log course_id, "course_assignment", course_id
  end

  def create_course_removal_log
    create_activity_log course_id, "course_removal", course_id
  end
end
