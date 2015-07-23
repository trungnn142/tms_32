class User < ActiveRecord::Base
  enum role: [:trainee, :supervisor]

  attr_accessor :remember_token
  has_many :course_users
  has_many :courses, through: :course_users
  has_many :user_subjects
  has_many :subjects, through: :user_subjects
  has_many :user_tasks
  has_many :tasks, through: :user_tasks
  has_many :activities

  has_secure_password

  validates :name, presence: true, length: {minimum: 6}
  validates :email, presence:true, length: {maximum: 255},
    format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i},
    uniqueness: {case_sensitive: false}

  def User.digest string
    cost = ActiveModel::SecurePassword.min_cost ? Bcrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attributes remember_digest: User.digest(self.remember_token)
  end

  def forget
    self.remember_token = nil
    update_attributes remember_digest: nil
  end

  def authenticated? remember_token
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

end
