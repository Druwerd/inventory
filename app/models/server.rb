class Server
  include MongoMapper::Document
  
  key :name, String, :unique => true, :required => true
  
  # update or add a server to the inventory
  def self.update_inventory(params)
    server = all(:name => params[:name]).first
    if server
      server.update_attributes(params)
    else
      server = create(params)
    end
    server
  end

end