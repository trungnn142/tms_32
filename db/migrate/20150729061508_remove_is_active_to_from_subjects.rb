class RemoveIsActiveToFromSubjects < ActiveRecord::Migration
  def change
    remove_column :subjects, :is_active
  end
end
