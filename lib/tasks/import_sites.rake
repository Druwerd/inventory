namespace :sites do
  desc "Imports sites from AssetTracker"
  task :import_sites => :environment do
    puts "> Importing sites from Asset Tracker ..."

    @hosts = `rt list -t asset "Type='Site' AND Status='production'" | awk -F ":" '{print $2}' | awk '{print $1}'`

    @hosts.each do |host|
      name = host.split.join("\n")
      puts "+ Importing #{name}"
      Site.new(:name => name).save
    end
    
    puts "> Import complete"

  end
end
