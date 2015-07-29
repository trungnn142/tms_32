class UserTask < ActiveRecord::Base
  belongs_to :user
  belongs_to :task
  belongs_to :user_subject

  validates :user_id, uniqueness: {scope: :task_id}

  scope :filter_by_user, ->user{where user_id: user.id}
end
