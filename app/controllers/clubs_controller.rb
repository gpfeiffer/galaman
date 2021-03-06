class ClubsController < ApplicationController
  skip_before_filter :authenticate_user!, :only => :index
  load_and_authorize_resource

  # GET /clubs
  # GET /clubs.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @clubs }
    end
  end

  # GET /clubs/1
  # GET /clubs/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.csv
      format.xml  { render :xml => @club }
      format.tex 
    end
  end

  # GET /clubs/new
  # GET /clubs/new.xml
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @club }
    end
  end

  # GET /clubs/1/edit
  def edit
  end

  # POST /clubs
  # POST /clubs.xml
  def create
    respond_to do |format|
      if @club.save
        format.html { redirect_to(@club, :notice => 'Club was successfully created.') }
        format.xml  { render :xml => @club, :status => :created, :location => @club }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @club.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /clubs/1
  # PUT /clubs/1.xml
  def update
    respond_to do |format|
      if @club.update_attributes(params[:club])
        format.html { redirect_to(@club, :notice => 'Club was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @club.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /clubs/1
  # DELETE /clubs/1.xml
  def destroy
    @club.destroy

    respond_to do |format|
      format.html { redirect_to(clubs_url) }
      format.xml  { head :ok }
    end
  end
end
