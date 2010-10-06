namespace :sites do
  desc "Updates page rank and load time stats for all sites"
  task :update_stats => :environment do
    puts "updating site stats"
    sites = Site.all
    sites.each do |site|
      puts "Updating #{site.name}"
      site.save
    end
  end
end