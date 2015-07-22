class UserSubject < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject
  has_many :user_tasks

  validates :user_id, uniqueness: {scope: :subject_id}
end
