class RenameTypeAndRemoveContentFromActivities < ActiveRecord::Migration
  def change
    rename_column :activities, :type, :action_type
    remove_column :activities, :content
  end
end
