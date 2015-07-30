class UserSubject < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject
  belongs_to :course
  has_many :user_tasks
  has_many :activities, dependent: :nullify

  validates :user_id, uniqueness: {scope: :subject_id}

  scope :filter_by_subject, ->subject_id{where subject_id: subject_id}
  scope :filter_by_user, ->user_id{where user_id: user_id}

  after_save :create_subject_completed_log

  def finished? user
    self.user_tasks.count == user.tasks.filter_by_subject(subject).count
  end

  private
  def create_subject_completed_log
    unless is_active
      create_activity_log subject_id, "subject_completed", course.id, id
    end
  end
end
