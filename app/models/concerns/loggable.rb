module Loggable
  extend ActiveSupport::Concern

  private
  def create_activity_log target_id, type, course_id, user_subject_id = nil
    Activity.create user_id: user_id, target_id: target_id, action_type: type,
      course_id: course_id, user_subject_id: user_subject_id
  end
end
