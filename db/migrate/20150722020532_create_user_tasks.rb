class CreateUserTasks < ActiveRecord::Migration
  def change
    create_table :user_tasks do |t|
      t.references :user, index: true, foreign_key: true
      t.references :task, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true
      t.references :user_subject, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
