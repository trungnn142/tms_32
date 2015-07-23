class ChangeActivateFromSubject < ActiveRecord::Migration
  def change
    change_column :subjects, :is_active, :boolean, default: false
  end
end
