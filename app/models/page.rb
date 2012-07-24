class Page
  include MongoMapper::Document

  key :title, String, :required => true
  key :path, String, :required => true
  key :body, String, :required => true
  key :parent, String

  timestamps!

  belongs_to :user

  def of?(given_user)
    given_user && user && user.id == given_user.id
  end

end
