class SitesController < ApplicationController
  
  respond_to :html, :xml, :json
  
  # GET /sites
  # GET /sites.xml
  def index
    @sites = Site.all(:reference => false, :order => 'page_rank DESC')
    @reference_sites = Site.all(:reference => true, :order => 'page_rank DESC')
    respond_to do |format|
      format.html { render :action => 'index' }
      format.xml  { render :xml => @sites }
      format.json { render :json => @sites }
    end
  end

  # GET /sites/1
  # GET /sites/1.xml
  def show
    respond_with(@site = Site.find(params[:id]))
  end

  # GET /sites/new
  # GET /sites/new.xml
  def new
    respond_with(@site = Site.new)
  end

  # GET /sites/1/edit
  def edit
    @site = Site.find(params[:id])
  end

  # POST /sites
  # POST /sites.xml
  def create
    @site = Site.new(params[:site])
    flash[:notice] = "Site was successfully created." if @site.save
    respond_with(@site)
  end

  # PUT /sites/1
  # PUT /sites/1.xml
  def update
    @site = Site.find(params[:id])
    flash[:notice] = "Site was successfully updated." if @site.update_attributes(params[:site])
    respond_with(@site)
  end
  
  def update_page_rank
    @site = Site.find(params[:id])
    flash[:notice] = "Page Rank was successfully updated." if @site.save
    respond_with(@site)
  end

  # DELETE /sites/1
  # DELETE /sites/1.xml
  def destroy
    @site = Site.find(params[:id])
    @site.destroy

    respond_to do |format|
      format.html { redirect_to(sites_url) }
      format.xml  { head :ok }
      format.json { head :ok }
    end
  end
end
