class CompetitionsController < ApplicationController
  # GET /competitions
  # GET /competitions.xml
  def index
    @competitions = Competition.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @competitions }
    end
  end

  # GET /competitions/1
  # GET /competitions/1.xml
  def show
    @competition = Competition.find(params[:id])
    @club = Club.find(params[:club_id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @competition }
    end
  end

  # GET /competitions/new
  # GET /competitions/new.xml
  def new
    @competition = Competition.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @competition }
    end
  end

  # GET /competitions/1/edit
  def edit
    @competition = Competition.find(params[:id])
  end

  # POST /competitions
  # POST /competitions.xml
  def create
    @competition = Competition.new(params[:competition])

    respond_to do |format|
      if @competition.save
        format.html { redirect_to(@competition, :notice => 'Competition was successfully created.') }
        format.xml  { render :xml => @competition, :status => :created, :location => @competition }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @competition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /competitions/1
  # PUT /competitions/1.xml
  def update
    @competition = Competition.find(params[:id])
    club = Club.find(params[:club_id])

    params[:competition] ||= {}
    params[:competition][:swimmer_ids] ||= []
    swimmer_ids = @competition.swimmer_ids - club.swimmer_ids 
    params[:competition][:swimmer_ids].each { |x| swimmer_ids << x.to_i }
    swimmer_ids.sort!
    params[:competition][:swimmer_ids] = swimmer_ids
    
    respond_to do |format|
      if @competition.update_attributes(params[:competition])
        format.html { redirect_to(competition_path(:id => @competition.id, :club_id => club.id),
 :notice => 'Registration successfully submitted.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @competition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /competitions/1
  # DELETE /competitions/1.xml
  def destroy
    @competition = Competition.find(params[:id])
    @competition.destroy

    respond_to do |format|
      format.html { redirect_to(competitions_url) }
      format.xml  { head :ok }
    end
  end
end
