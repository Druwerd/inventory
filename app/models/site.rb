class Site
  include MongoMapper::Document
  
  key :name, String, :unique => true, :required => true
  key :page_rank, String
  key :load_time, String
  
  before_save :get_page_rank, :get_page_load_time
  
  def get_page_rank()
    self.page_rank = PageRankr.ranks(self.name)[:google]
  end
  
  def get_page_load_time()
    url = self.name
    url = "http://#{url}" if url !~ /^https?:\/\//
    url = URI.parse(url)
    start_time = Time.now
    req = Net::HTTP.start(url.host, url.port){ |http|
      http.get('/')
    }
    self.load_time = Time.now - start_time
  rescue 
    self.load_time = -1
  end
  
end
