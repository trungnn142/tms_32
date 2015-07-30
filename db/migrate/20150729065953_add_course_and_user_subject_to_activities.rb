class AddCourseAndUserSubjectToActivities < ActiveRecord::Migration
  def change
    add_reference :activities, :course, index: true, foreign_key: true
    add_reference :activities, :user_subject, index: true, foreign_key: true
  end
end
