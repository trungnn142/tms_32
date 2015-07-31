class AddIsOwnerToCourseUsers < ActiveRecord::Migration
  def change
    add_column :course_users, :is_owner, :boolean, default: false
  end
end
