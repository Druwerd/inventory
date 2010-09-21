class Server
  include MongoMapper::Document
  
  key :name, String, :unique => true, :required => true
  
end