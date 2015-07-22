class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.boolean :is_active

      t.timestamps null: false
    end

    create_table :course_users do |t|
      t.belongs_to :course, index: true
      t.belongs_to :user, index: true
    end
  end
end
