# encoding: utf-8
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

    @project = @play.project
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
    @composer = @play.composer
    @project = @play.project
  end

  # POST /plays
  # POST /plays.xml
  def create
    @project = Project.find params[:project_id]
    @play = @project.plays.new(params[:play])
    
    @composer = Composer.find_or_create_instance(params[:composer][:firstname], params[:composer][:lastname])
    
    respond_to do |format|
      if @play.valid? && @composer.valid?
        @play.composer = @composer
        @play.save
        format.html { redirect_to(project_plays_path(:project_id => @project.id, :id => @play.id), :notice => 'Stück wurde erfolgreich erstellt.') }
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
        format.html { redirect_to(@play, :notice => 'Stück wurde erfolgreich angepasst.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @play.errors, :status => :unprocessable_entity }
      end
    end
  end

  def add_soloist
    @play = Play.find params[:id]
    @project = @play.project
    @person = Person.new
    @person = @play.soloist if @play.soloist
    
    respond_to do |format|
      format.ajax
    end
  end
  
  def save_soloist
    @play = Play.find params[:id]
    @project = @play.project
    
    @soloist = nil
    
    if params[:name]
      names = params[:name].strip.split(" ")
      firstname = names[0]
      lastname = names[1]
      @soloist = Person.find_by_firstname_and_lastname(firstname, lastname)
      @play.soloist = @soloist
      @soloist.update_attributes(params[:person])
      
      if params[:avatar] && !params[:avatar][:photo].blank?
        @soloist.avatar.destroy if @soloist.avatar
        
        pic = Avatar.new params[:avatar]
        pic.person = @soloist
        pic.save
      end
    end 
    
    respond_to do |format|
      format.html do
        if @soloist && @soloist.save && @play.save
          notice = "Solist erfolgreich hinzugefügt"
        else
          notice = "Solist konnte nicht gefunden werden"
        end
        redirect_to(project_play_path(:project_id => @project.id, :id => @play.id), :notice => notice)
      end
    end
  end
  
  def change_parts_order
    @play = Play.find params[:id]
    @parts = @play.parts
    
    respond_to do |format|
      format.ajax
    end
  end
  
  def save_parts_order
    @play = Play.find params[:id]
    parts_ids = params[:parts_order].split(",")

    parts_ids.each_with_index do |id, index|
      part = Part.find id
      if part
        part.play_position = index
        part.save
      end
    end
    
    respond_to do |format|
      format.html {redirect_to project_play_path(:project_id => @play.project.id, :id => @play.id), :notice => "Reihenfolge geändert." }
    end
  end

  # DELETE /plays/1
  # DELETE /plays/1.xml
  def destroy
    @play = Play.find(params[:id])
    project = @play.project
    @play.destroy

    respond_to do |format|
      format.html { redirect_to(project_plays_path(project), :notice => "Stück gelöscht.") }
      format.xml  { head :ok }
    end
  end
end
