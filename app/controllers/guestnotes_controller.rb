#encoding: utf-8
class GuestnotesController < ApplicationController
  filter_access_to :all
  
  validates_captcha
  
  def index
    @guestnotes = Guestnote.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @guestnote = Guestnote.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def new
    @guestnote = Guestnote.new

    respond_to do |format|
      format.js
    end
  end

  def edit
    @guestnote = Guestnote.find(params[:id])
    
    respond_to do |format|
      format.js
    end
  end

  def create
    @guestnote = Guestnote.new(params[:guestnote])

    respond_to do |format|
      if captcha_validated? && @guestnote.save
        format.html { redirect_to(guestnotes_path, :notice => 'Gästebucheintrag erfolgreich erstellt.') }
      else
        format.html { redirect_to(guestnotes_path, :notice => 'Eintrag konnte nicht erstellt werden.') }
      end
    end
  end

  def update
    @guestnote = Guestnote.find(params[:id])

    respond_to do |format|
      if @guestnote.update_attributes(params[:guestnote])
        format.html { redirect_to(guestnotes_path, :notice => 'Eintrag erfolgreich angepasst.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @guestnote = Guestnote.find(params[:id])
    @guestnote.destroy

    respond_to do |format|
      format.html { redirect_to(guestnotes_url, :notice => "Eintrag gelöscht") }
    end
  end
end
