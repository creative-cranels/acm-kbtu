class User
  include MongoMapper::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable and :omniauthable
  # :recoverable, :trackable
  devise :database_authenticatable, :registerable, :validatable, :timeoutable, :rememberable

  # rememberable
  key :remember_created_at, Time

  ROLES = ["admin", "moderator", "user"]

  key :email, String
  key :encrypted_password, String

  key :role, String, :default => "user"

  timestamps!

  def admin?; role == "admin" ; end
  def moderator?; role == "moderator" ; end
  def user?; role == "user" ; end
  def guest?; role != "user" && role != "moderator" && role != "admin" ; end

end
