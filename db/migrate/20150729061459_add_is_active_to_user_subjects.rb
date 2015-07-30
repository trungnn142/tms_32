class AddIsActiveToUserSubjects < ActiveRecord::Migration
  def change
    add_column :user_subjects, :is_active, :boolean, default: true
  end
end
