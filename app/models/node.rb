class Node
  include MongoMapper::Document

  key :name, String, :required => true
  key :path, String, :required => true
  key :order, String

end
