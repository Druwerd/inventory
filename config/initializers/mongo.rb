db_host = Rails.configuration.database_configuration[Rails.env]["host"]
db_port = Rails.configuration.database_configuration[Rails.env]["port"]

MongoMapper.connection = Mongo::Connection.new(db_host, db_port)
MongoMapper.database = Rails.configuration.database_configuration[Rails.env]["database"]

if defined?(PhusionPassenger)
   PhusionPassenger.on_event(:starting_worker_process) do |forked|
     MongoMapper.connection.connect_to_master if forked
   end
end