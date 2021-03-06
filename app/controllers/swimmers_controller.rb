class SwimmersController < ApplicationController
  load_and_authorize_resource

  # GET /swimmers
  # GET /swimmers.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @swimmers }
    end
  end

  # GET /swimmers/1
  # GET /swimmers/1.xml
  def show
    @results = @swimmer.results.select { |x| x.time and x.time > 0 }
    if params[:discipline_id]
      @discipline = Discipline.find(params[:discipline_id])
      @results = @results.group_by(&:discipline)
    end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @swimmer }
      format.json  { render :json => @swimmer }
      format.tex 
    end
  end

  # GET /swimmers/new
  # GET /swimmers/new.xml
  def new
    @swimmer.club = Club.find(params[:club_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @swimmer }
    end
  end

  # GET /swimmers/1/edit
  def edit
  end

  # POST /swimmers
  # POST /swimmers.xml
  def create
    respond_to do |format|
      if @swimmer.save
        format.html { redirect_to(@swimmer.club, :notice => 'Swimmer was successfully created.') }
        format.xml  { render :xml => @swimmer, :status => :created, :location => @swimmer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @swimmer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /swimmers/1
  # PUT /swimmers/1.xml
  def update
    respond_to do |format|
      if @swimmer.update_attributes(params[:swimmer])
        format.html { redirect_to(@swimmer.club, :notice => 'Swimmer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @swimmer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /swimmers/1
  # DELETE /swimmers/1.xml
  def destroy
    @swimmer.destroy

    respond_to do |format|
      format.html { redirect_to @swimmer.club }
      format.xml  { head :ok }
    end
  end
end
