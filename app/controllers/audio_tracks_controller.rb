# encoding: utf-8
class AudioTracksController < ApplicationController
  filter_access_to :all
  
  def new
    @track = AudioTrack.new
    
    respond_to do |format|
      format.ajax
    end
  end
  
  def create
    if params[:audio_track]
      @project = Project.find(params[:project_id])

      track = AudioTrack.new params[:audio_track]
      track.project = @project

      if track.save()
        flash[:notice] = "Die Datei wurde erfolgreich gespeichert."
      else
        flash[:notice] = "Die Datei konnte nicht gespeichert werden."
      end
      
      respond_to do |format|
        format.html { redirect_to(project_plays_path(:project_id => @project.id)) }
      end
    end
  end
  
  def destroy
    @track = AudioTrack.find params[:id]
    @project = @track.project
    flash[:notice] = "File konnte nicht gelöscht werden"
    if @track
      @track.destroy
      flash[:notice] = "File erfolgreich gelöscht."
    end
    redirect_to project_plays_path(:project_id => @project.id)
  end
  
end
