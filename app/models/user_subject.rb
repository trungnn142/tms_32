class UserSubject < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject
  belongs_to :course
  has_many :user_tasks

  validates :user_id, uniqueness: {scope: :subject_id}

  scope :filter_by_subject, ->subject_id{where subject_id: subject_id}
  scope :filter_by_user, ->user_id{where user_id: user_id}
end
