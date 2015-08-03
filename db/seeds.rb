User.create(name:  "Luong Viet Dung",
             email: "luong.viet.dung@framgia.com",
             password:              "123456",
             password_confirmation: "123456",
             role: :supervisor)
User.create(name:  "Trinh Duc Duy",
             email: "trinh.duc.duy@framgia.com",
             password:              "123456",
             password_confirmation: "123456",
             role: :supervisor)
User.create(name:  "Nguyen Ngoc Trung",
             email: "nguyen.ngoc.trung@framgia.com",
             password:              "123456",
             password_confirmation: "123456",
             role: :supervisor)

50.times do |n|
  name  = Faker::Name.name
  email = "superman-#{n+1}@tms32.com"
  User.create!(name:  name, email: email, password: "Tms32@2015",
    password_confirmation: "Tms32@2015", role: :trainee)
end

20.times do |n|
  name = Faker::Name.title
  instruction = Faker::Lorem.paragraphs(3).join(" <br /> ")
  Subject.create!(name: name, instruction: instruction)
end

subjects = Subject.order(:created_at)

subjects.each do |subject|
  12.times do |i|
    name = Faker::Name.title
    order = i + 1
    subject.tasks.create!(name: name, order: order)
  end
end

10.times do |n|
  name = Faker::Name.title
  description = Faker::Lorem.paragraphs(5).join(" <br /> ")
  start_date = Date.today().strftime("%F")
  end_date =  (Date.today() + rand(1..100).days).strftime("%F")
  Course.create!(name: name, description: description, is_active: true,
    start_date: start_date, end_date: end_date)
end

supervisors = User.where role: 1
courses = Course.order(:created_at)

courses.each do |course|
  supervisor = supervisors.find rand(1..3)
  course.course_users.create!(user_id: supervisor.id, is_owner: true)
end
