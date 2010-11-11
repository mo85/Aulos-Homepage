class PlaysController < ApplicationController
  filter_access_to :all
  
  # GET /plays
  # GET /plays.xml
  def index
    @project = Project.find params[:project_id]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @plays }
    end
  end

  # GET /plays/1
  # GET /plays/1.xml
  def show
    @play = Play.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @play }
    end
  end

  # GET /plays/new
  # GET /plays/new.xml
  def new
    @project = Project.find params[:project_id]
    @play = Play.new
    @composer = Composer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @play }
    end
  end

  # GET /plays/1/edit
  def edit
    @play = Play.find(params[:id])
    @project = @play.project
  end

  # POST /plays
  # POST /plays.xml
  def create
    @project = Project.find params[:project_id]
    @play = @project.plays.new(params[:play])
    
    puts params

    respond_to do |format|
      if @play.save
        format.html { redirect_to(@project, :notice => 'Play was successfully created.') }
        format.xml  { render :xml => @play, :status => :created, :location => @play }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @play.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /plays/1
  # PUT /plays/1.xml
  def update
    @play = Play.find(params[:id])

    respond_to do |format|
      if @play.update_attributes(params[:play])
        format.html { redirect_to(@play, :notice => 'Play was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @play.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /plays/1
  # DELETE /plays/1.xml
  def destroy
    @play = Play.find(params[:id])
    project = @play.project
    @play.destroy

    respond_to do |format|
      format.html { redirect_to(project_plays_path(project)) }
      format.xml  { head :ok }
    end
  end
end
