class User
  include MongoMapper::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable and :omniauthable
  # :recoverable, :trackable
  devise :database_authenticatable, :registerable, :validatable, :timeoutable, :rememberable

  # rememberable
  key :remember_created_at, Time

  key :email, String
  key :encrypted_password, String

  timestamps!

end
