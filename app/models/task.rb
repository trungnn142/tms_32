class Task < ActiveRecord::Base
  belongs_to :subject
  has_many :user_tasks
  has_many :users, through: :user_tasks

  validates :name, presence: true
  validates :order, presence: true, numericality: {only_integer: true,
    greater_than_or_equal_to: 0}
end
