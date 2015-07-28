class CourseSubject < ActiveRecord::Base
  belongs_to :course
  belongs_to :subject

  validates :course_id, uniqueness: {scope: :subject_id}

  after_save :add_subject_to_user
  after_destroy :destroy_subject_users

  private
  def add_subject_to_user
    course.course_users.each do |course_user|
      subject.user_subjects.create user_id: course_user.user_id,
        course_id: course_id
    end
  end

  def destroy_subject_user
    course.user_subjects.filter_by_subject(subject_id).delete_all
  end
end
