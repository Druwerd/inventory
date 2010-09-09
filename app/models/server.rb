class Server
  include MongoMapper::Document
  
  key :name, String, :unique => true
  
end