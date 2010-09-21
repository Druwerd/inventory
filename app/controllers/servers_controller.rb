class ServersController < ApplicationController
  
  respond_to :html, :xml, :json
  skip_before_filter :verify_authenticity_token
  
  # GET /servers
  # GET /servers.xml
  def index
    respond_with(@servers = Server.all(:order => 'name'))
  end

  # GET /servers/1
  # GET /servers/1.xml
  def show
    respond_with(@server = Server.find(params[:id]))
  end

  # GET /servers/new
  # GET /servers/new.xml
  def new
    respond_with(@server = Server.new)
  end

  # GET /servers/1/edit
  def edit
    respond_with(@server = Server.find(params[:id]))
  end

  # POST /servers
  # POST /servers.xml
  def create
    @server = Server.update_inventory(params[:server])
    respond_with(@server)
  end

  # PUT /servers/1
  # PUT /servers/1.xml
  def update
    @server = Server.find(params[:id])
    @server.update_attributes(params[:server])
    respond_with(@server)
  end

  # DELETE /servers/1
  # DELETE /servers/1.xml
  def destroy
    @server = Server.find(params[:id])
    @server.destroy

    respond_to do |format|
      format.html { redirect_to(servers_url) }
      format.xml  { head :ok }
      format.json { head :ok }
    end
  end
end
