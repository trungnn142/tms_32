class AddCourseToUserSubjects < ActiveRecord::Migration
  def change
    add_reference :user_subjects, :course, index: true, foreign_key: true
  end
end
