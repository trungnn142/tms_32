class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  belongs_to :user_subjects
  before_create :create_target_name

  scope :latest, ->{order created_at: :desc}

  private
  def find_target
    case action_type
    when "course_removal", "course_assignment"
      Course.find_by id: target_id
    when "subject_completed"
      Subject.find_by id: target_id
    else
      Task.find_by id: target_id
    end
  end

  def create_target_name
    self.target_name = find_target.nil? ? "" : find_target.name
  end
end
