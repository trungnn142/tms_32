class CourseSubject < ActiveRecord::Base
  after_create :active_subject

  belongs_to :course
  belongs_to :subject

  validates :course_id, uniqueness: {scope: :subject_id}

  private
  def active_subject
    subject.update_attributes is_active: true unless subject.is_active?
  end
end
