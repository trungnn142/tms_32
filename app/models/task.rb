class Task < ActiveRecord::Base
  belongs_to :subject, inverse_of: :tasks
  has_many :user_tasks
  has_many :users, through: :user_tasks

  validates :name, presence: true
  validates :order, presence: true, numericality: {only_integer: true,
    greater_than_or_equal_to: 0}
  validates :subject, presence: true

  scope :filter_by_subject, ->subject{where subject_id: subject.id}

  def finished? user_tasks, user_subject
    user_tasks.detect{|user_task| user_task.user_subject_id == user_subject.id &&
      user_task.task_id == self.id}.present?
  end
end
