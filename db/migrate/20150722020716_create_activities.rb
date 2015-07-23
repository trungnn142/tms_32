class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.references :user, index: true, foreign_key: true
      t.string :content
      t.string :type
      t.integer :target_id

      t.timestamps null: false
    end
  end
end
