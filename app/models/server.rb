class Server
  include MongoMapper::Document
  
  key :fqdn, String, :unique => true, :required => true
  
  # update or add a server to the inventory
  def self.update_inventory(params)
    server = all(:fqdn => params[:fqdn]).first
    if server
      server.update_attributes(params)
    else
      server = create(params)
    end
    server
  end

end