# encoding: utf-8
class ConductorsController < ApplicationController
  
  def index
    @conductors = Conductor.all
    
    respond_to do |format|
      format.html
    end
  end
  
  def show
    @conductor = Conductor.find params[:id]
    
    respond_to do |format|
      format.html
    end
  end
  
  def new
    @project = Project.find params[:project_id]
    @conductor = Conductor.new(:country => "Switzerland", :project => @project)
    
    respond_to do |format|
      format.html
    end
  end
  
  def create
    @project = Project.find params[:project_id]
    @conductor = Conductor.new(params[:conductor])
    
    respond_to do |format|
      if @conductor.save
        flash[:notice] = "Dirigent wurde erfolgreich hinzugefügt."
        format.html { redirect_to @conductor.project }
      else
        format.html { render :action => "new", :locals => { :project_id => @project.id } }
      end
    end
  end
  
  def edit
    @project = Project.find params[:project_id]
    @conductor = @project.conductor
    
    respond_to do |format|
      format.html
    end
  end
  
  def update
    @conductor = Conductor.find params[:id]
    @project = @conductor.project
    
    respond_to do |format|
      if @conductor.update_attributes(params[:conductor])
        format.html { redirect_to project_conductor_path(:project_id => @project.id, :id => @conductor.id) }
      else
        format.html { render :action => "edit" }
      end
    end
  end
  
  def destroy
    @conductor = Conductor.find params[:id]
    @project = @conductor.project
    @conductor.destroy
    flash[:notice] = "Dirigent erfolgreich gelöscht."
    
    respond_to do |format|
      format.html { redirect_to @project }
    end
  end
  
end
