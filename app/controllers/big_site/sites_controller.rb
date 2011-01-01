class BigSite::SitesController < ApplicationController
  # GET /big_site/sites
  # GET /big_site/sites.xml
  def index
    @big_site_sites = BigSite::Site.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @big_site_sites }
    end
  end

  # GET /big_site/sites/1
  # GET /big_site/sites/1.xml
  def show
    @big_site_site = BigSite::Site.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @big_site_site }
    end
  end

  # GET /big_site/sites/new
  # GET /big_site/sites/new.xml
  def new
    @big_site_site = BigSite::Site.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @big_site_site }
    end
  end

  # GET /big_site/sites/1/edit
  def edit
    @big_site_site = BigSite::Site.find(params[:id])
  end

  # POST /big_site/sites
  # POST /big_site/sites.xml
  def create
    @big_site_site = BigSite::Site.new(params[:big_site_site])

    respond_to do |format|
      if @big_site_site.save
        format.html { redirect_to(@big_site_site, :notice => 'Site was successfully created.') }
        format.xml  { render :xml => @big_site_site, :status => :created, :location => @big_site_site }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @big_site_site.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /big_site/sites/1
  # PUT /big_site/sites/1.xml
  def update
    @big_site_site = BigSite::Site.find(params[:id])

    respond_to do |format|
      if @big_site_site.update_attributes(params[:big_site_site])
        format.html { redirect_to(@big_site_site, :notice => 'Site was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @big_site_site.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /big_site/sites/1
  # DELETE /big_site/sites/1.xml
  def destroy
    @big_site_site = BigSite::Site.find(params[:id])
    @big_site_site.destroy

    respond_to do |format|
      format.html { redirect_to(big_site_sites_url) }
      format.xml  { head :ok }
    end
  end
end
