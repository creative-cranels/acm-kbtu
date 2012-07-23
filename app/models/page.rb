class Page
  include MongoMapper::Document

  key :title, String, :required => true
  key :path, String, :required => true
  key :body, String, :required => true
  key :parent, String

  timestamps!

end
