# encoding: utf-8 
class ProjectsController < ApplicationController
  filter_access_to :all
  
  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to(@project, :notice => 'Projekt wurde erfolgreich erstellt.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to(@project, :notice => 'Projekt wurde erfolgreich angepasst.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  def change_plays_order
    @project = Project.find params[:id]
    @plays = @project.plays
    
    respond_to do |format|
      format.ajax
    end
    
  end
  
  def autocomplete_members
    name = "%#{params[:name]}%"
    @project = Project.find params[:id]
    @members = @project.members.includes("person").where("people.firstname like ? OR people.lastname like ?", name, name).collect(&:person)
    
    respond_to do |format|
      format.ajax
    end
  end
  
  def save_plays_order
    @project = Project.find params[:id]
    play_ids = params[:order].split(",")

    play_ids.each_with_index do |id, index|
      play = Play.find id
      if play
        play.program_position = index
        play.save
      end
    end
    
    respond_to do |format|
      format.html {redirect_to project_plays_path(:project_id => @project.id), :notice => "Reihenfolge geändert." }
    end
  end
  
  def add_member
    @project = Project.find params[:id]
    
    respond_to do |format|
      format.js
    end
  end
  
  def save_member
    name = params[:query].strip.split
    firstname = name[0]
    lastname = name[1]
    
    person = Instrumentalist.find_by_firstname_and_lastname(firstname, lastname)
    @project = Project.find params[:id]
    
    respond_to do |format|
      if person
        membership = Membership.create(:instrumentalist => person, :project => @project, :instrument_id => params[:membership][:instrument_id])
        flash[:notice] = "Die Person #{person} wurde hinzugefügt."
        format.html { redirect_to @project }
      else
        flash[:notice] = "Die Person wurde nicht gefunden."
        format.html { render :action => "add_member" }
      end

    end
  end
  
  def remove_member
    @project = Project.find params[:id]
    
    membership = Membership.find_by_project_id_and_instrumentalist_id(@project.id, params[:instrumentalist_id])
    
    if membership
      membership.delete
      flash[:notice] = "Person wurde enfernt."
    else
      flash[:notice] = "Die Person konnte nicht enfernt werden, da sie nicht zum Projekt gehört."
    end
    
    respond_to do |format|
      format.html { redirect_to @project }
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to(projects_url, :notice => "Projekt gelöscht.") }
    end
  end
end
