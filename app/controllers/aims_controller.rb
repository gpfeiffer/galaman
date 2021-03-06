class AimsController < ApplicationController
  load_and_authorize_resource except: [:new]

  # GET /aims
  # GET /aims.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @aims }
    end
  end

  # GET /aims/1
  # GET /aims/1.xml
  def show
    @times = @aim.qtimes
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @aim }
    end
  end

  # GET /aims/new
  # GET /aims/new.xml
  def new
    @aim = Aim.new(swimmer: Swimmer.find(params[:swimmer_id]))
    authorize! :new, @aim

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @aim }
    end
  end

  # GET /aims/1/edit
  def edit
  end

  # POST /aims
  # POST /aims.xml
  def create
    respond_to do |format|
      if @aim.save
        format.html { redirect_to(@aim.swimmer, :notice => 'Aim was successfully created.') }
        format.xml  { render :xml => @aim, :status => :created, :location => @aim }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @aim.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /aims/1
  # PUT /aims/1.xml
  def update
    respond_to do |format|
      if @aim.update_attributes(params[:aim])
        format.html { redirect_to(@aim.swimmer, :notice => 'Aim was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @aim.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /aims/1
  # DELETE /aims/1.xml
  def destroy
    @aim.destroy

    respond_to do |format|
      format.html { redirect_to @aim.swimmer }
      format.xml  { head :ok }
    end
  end
end
