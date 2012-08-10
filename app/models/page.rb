class Page
  include MongoMapper::Document

  key :title, String, :required => true
  key :path, String, :required => true
  key :body, String, :required => true
  key :author, String, :required => true
  key :order, String
  key :parent, String

  timestamps!

  belongs_to :user

  def of?(given_user)
    given_user && user && user.id == given_user.id
  end

  def before_save(page)
    page.body = '.' if page.parent == 'main_page'
    page.parent.downcase!
    page
  end
end
