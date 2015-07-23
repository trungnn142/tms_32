User.create!(name:  "Luong Viet Dung",
             email: "luong.viet.dung@framgia.com",
             password:              "123456",
             password_confirmation: "123456",
             role: :trainee)
User.create!(name:  "Trinh Duc Duy",
             email: "trinh.duc.duy@framgia.com",
             password:              "123456",
             password_confirmation: "123456",
             role: :supervisor)
User.create!(name:  "Nguyen Ngoc Trung",
             email: "nguyen.ngoc.trung@framgia.com",
             password:              "123456",
             password_confirmation: "123456",
             role: :supervisor)

Course.create([
    {
      name: "Discover git",
      description: "Discover the basics of Git, including how to initialize \
        a repo. Learn how to add, commit, and push your code to GitHub.",
      is_active: true,
      start_date: "2015-08-20",
      end_date: "2015-09-20"
    },
    {
      name: "Beginning Ruby",
      description: "Ruby is a dynamic, open source programming language with a \
        focus on simplicity and productivity. It has an elegant syntax that is \
        natural to read and easy to write.",
      is_active: true,
      start_date: "2015-10-10",
      end_date: "2015-11-05"
    },
    {
      name: "MySQL Basic",
      description: "MySQL is a popular choice of database for use in web \
        applications, and is a central component of the widely used LAMP open \
        source web application software stack. This course covers the \
        fundamentals of MySQL, including how to install MySQL as well as write \
        basic data retrieval and data modification queries.",
      is_active: true,
      start_date: "2015-12-12",
      end_date: "2015-12-27"
    }
  ])

Subject.create([
    {
      name: "Rails for Zombies Redux",
      instruction:  "Learn Ruby on Rails, an open-source framework for the Ruby
        programming language. Rails for Zombies will teach you all the Rails
        basics with a zombie flair."
    },
    {
      name: "Rails for Zombies 2",
      instruction:  "Learn more Rails with this sequel to the infamous Rails for
        Zombies course. Increase your Ruby on Rails knowledge with even more zombie learning."
    },
    {
      name: "Surviving APIs with Rails",
      instruction: "Learn how to build and test REST APIs using Ruby on Rails.
        See how to leverage the HTTP protocol to create robust web APIs that can
        serve different client applications at the same time."
    },
    {
      name: "Rails 4 Patterns",
      instruction: "Learn helpful patterns and techniques for building and
        maintaining complex Rails applications. Make your application easily
        scale in size and complexity."
    },
    {
      name: "Rails Testing for Zombies",
      instruction: "Learn Rails testing for your applications with these testing
        fundamentals. Brush up on testing best practices with Rails Testing for Zombies."
    },
    {
      name: "Testing with RSpec",
      instruction: "Learn to use this trusted testing framework for Ruby
        applications. Brush up on testing best practices with our Testing with RSpec course."
    }
  ])
