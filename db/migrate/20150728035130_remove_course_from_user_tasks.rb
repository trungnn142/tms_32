class RemoveCourseFromUserTasks < ActiveRecord::Migration
  def change
    remove_column :user_tasks, :course_id
  end
end
