# encoding: utf-8 
class ProjectsController < ApplicationController
  filter_access_to :all
  
  # GET /projects
  # GET /projects.xml
  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.xml
  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.xml
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.xml
  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to(@project, :notice => 'Projekt wurde erfolgreich erstellt.') }
        format.xml  { render :xml => @project, :status => :created, :location => @project }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.xml
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to(@project, :notice => 'Projekt wurde erfolgreich angepasst.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
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
    
    person = Person.find_by_firstname_and_lastname(firstname, lastname)
    @project = Project.find params[:id]
    
    respond_to do |format|
      if person
        membership = Membership.create(:person => person, :project => @project, :instrument_id => params[:membership][:instrument_id])
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
    
    membership = Membership.find_by_project_id_and_person_id(@project.id, params[:person_id])
    
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

  # DELETE /projects/1
  # DELETE /projects/1.xml
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to(projects_url, :notice => "Projekt gelöscht.") }
    end
  end
end
