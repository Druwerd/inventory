class Site
  include MongoMapper::Document
  
  key :name, String, :unique => true, :required => true
  key :page_rank, String
  
  before_save :get_page_rank
  
  def get_page_rank()
    self.page_rank = PageRankr.ranks(self.name)[:google]
  end
  
end
