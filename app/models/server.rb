class Server
  include MongoMapper::Document
  
  key :name, String, :unique => true
  key :os, String
  
end