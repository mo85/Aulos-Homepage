# encoding: utf-8
class PartsController < ApplicationController
  filter_access_to :all
  
  def index
    @parts = Part.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @part = Part.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @part = Part.new
    @play = Play.find params[:play_id]
    @project = @play.project

    respond_to do |format|
      format.ajax
    end
  end


  def edit
    @part = Part.find(params[:id])
    @play = @part.play
    @project = @play.project
    
    respond_to do |format|
      format.ajax
    end
  end

  def create
    @part = Part.new(params[:part])
    @play = Play.find params[:play_id]
    @part.play = @play

    respond_to do |format|
      if @part.save
        format.html { redirect_to(project_play_path(:project_id => @play.project.id, :id => @play.id), :notice => 'Satz wurde hinzugefügt.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @part = Part.find(params[:id])
    @play = @part.play
    @project = @play.project

    respond_to do |format|
      if @part.update_attributes(params[:part])
        format.html { redirect_to(project_play_path(:project_id => @play.project.id, :id => @play.id), :notice => 'Satz erfolgreich geändert.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @part = Part.find(params[:id])
    @play = @part.play
    @project = @play.project
    @part.destroy

    respond_to do |format|
      format.html { redirect_to(project_play_path(:project_id => @play.project.id, :id => @play.id), :notice => "Satz erfolgreich gelöscht.") }
    end
  end
end
