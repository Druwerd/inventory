class Server
  include MongoMapper::Document
  set_collection_name 'nodes'
  
  key :fqdn, String, :unique => true, :required => true
  
  def last_updated
    Time.at(self.lastseen)
  end
  
  def self.search(search_params)
    if search_params.include?("fact=")
      search_by_fact(search_params)
    elsif search_params.include?("class=")
      search_by_class(search_params)
    else
      serach_by_hostname(search_params)
    end
  end
  
  def self.search_by_fact(search_params)
    fact_string = search_params.split("=",2).last.strip
    fact_name, fact_value = fact_string.split(":", 2)
    Server.where("facts.#{fact_name.strip}" => fact_value.strip).sort(:fqdn).all
  end
  
  def self.search_by_class(search_params)
    class_name = search_params.split("=",2).last
    Server.where("classes" => class_name.strip).sort(:fqdn).all
  end
  
  def self.serach_by_hostname(search_params)
    Server.where("fqdn" => /.*#{search_params}.*/).sort(:fqdn).all
  end

end