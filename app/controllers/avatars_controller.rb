class AvatarsController < ApplicationController
  filter_access_to :all
  
  def new
    @person = Person.find(params[:person_id])
    
    @avatar = Avatar.new
    
    respond_to do |format|
      format.js
    end
  end
  
  def create
    if params[:avatar]
      @person = Person.find(params[:person_id])
      # destroy the old one...
      @person.avatar.destroy if @person.avatar

      pic = Avatar.new params[:avatar]
      pic.person = @person

      if pic.save()
        flash[:notice] = "Das Bild wurde erfolgreich gespeichert."
      else
        flash[:notice] = "Das Bild konnte nicht gespeichert werden."
      end
      
      respond_to do |format|
        format.html { redirect_to(project_conductor_path(:project_id => @person.project.id, :id => @person.id)) }
      end
      
    else
      flash[:notice] = "Invalid parameters."
      respond_to do |format|
        format.html { redirect_to(project_conductor_path(:project_id => @person.project.id, :id => @person.id)) }
      end
    
    end
    
  end
  
end
