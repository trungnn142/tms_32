class AddClosedToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :closed, :boolean, default: false
  end
end
