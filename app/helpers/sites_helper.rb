module SitesHelper
  
  def show_page_rank(site)
    page_rank = site.page_rank
    (page_rank.to_i >= 0)? page_rank : "N/A"
  end
end
