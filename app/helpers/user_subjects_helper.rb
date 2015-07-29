module UserSubjectsHelper
  def percent_complete_subject user_subject
    percent = user_subject.subject.tasks.count > 0 ?
      user_subject.user_tasks.count * 100.0 / user_subject.subject.tasks.count : 0
    number_to_percentage percent, precision: 0
  end
end
