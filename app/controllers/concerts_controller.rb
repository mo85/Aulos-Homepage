# encoding: utf-8
class ConcertsController < ApplicationController
  filter_access_to :all
  
  # GET /concerts
  # GET /concerts.xml
  def index
    @project = Project.find params[:project_id]
    @concerts = @project.concerts
        
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @concerts }
    end
  end

  # GET /concerts/1
  # GET /concerts/1.xml
  def show
    @concert = Concert.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @concert }
    end
  end

  # GET /concerts/new
  # GET /concerts/new.xml
  def new
    @project = Project.find params[:project_id]
    @concert = Concert.new
    @location = Location.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @concert }
    end
  end

  # GET /concerts/1/edit
  def edit
    @concert = Concert.find(params[:id])
    @project = Project.find params[:project_id]
  end

  # POST /concerts
  # POST /concerts.xml
  def create
    @project = Project.find params[:project_id]
    @concert = Concert.new(params[:concert])
    @location = Location.new(params[:location])
    @concert.location = @location
    @concert.project = @project
    
    respond_to do |format|
      if @location.save && @concert.save
        format.html { redirect_to(project_concerts_path(:project_id => @project.id), :notice => 'Konzert erfolgreich erstellt.') }
        format.xml  { render :xml => @concert, :status => :created, :location => @concert }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @concert.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /concerts/1
  # PUT /concerts/1.xml
  def update
    @concert = Concert.find(params[:id])
    @project = @concert.project

    respond_to do |format|
      if @concert.update_attributes(params[:concert])
        format.html { redirect_to(project_concerts_path(@project), :notice => 'Konzert erfolgreich angepasst.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @concert.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /concerts/1
  # DELETE /concerts/1.xml
  def destroy
    @concert = Concert.find(params[:id])
    @concert.destroy
    @project = Project.find params[:project_id]

    respond_to do |format|
      format.html { redirect_to(project_concerts_url(@project), :notice => "Konzert gelöscht.") }
      format.xml  { head :ok }
    end
  end
end
