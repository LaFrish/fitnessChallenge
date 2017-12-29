
class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :logs
  has_many :foods
  has_many :waters
  has_many :sleeps
  has_many :workouts
  has_many :goals

accepts_nested_attributes_for :logs, :allow_destroy => true
accepts_nested_attributes_for :goals, :allow_destroy => true
accepts_nested_attributes_for :workouts, :allow_destroy => true
accepts_nested_attributes_for :waters, :allow_destroy => true
accepts_nested_attributes_for :foods, :allow_destroy => true
accepts_nested_attributes_for :sleeps, :allow_destroy => true
  # attr_accessible :email, :password, :password_confirmation

  # attr_accessor :password
  # before_save :encrypt_password

  # validates_confirmation_of :password
  # validates_presence_of :password, :on => :create
  # validates_presence_of :email
  # validates_uniqueness_of :email

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def fullname
  "#{firstName} #{lastName}"
end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
