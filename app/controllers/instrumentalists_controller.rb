class InstrumentalistsController < ApplicationController
  filter_access_to :all
  
  def autocomplete
    name = "%#{params[:query]}%"
    @people = Instrumentalist.where("firstname like ? OR lastname like ?", name, name)

    respond_to do |format|
      format.js
    end
  end
  
  def index
    @people = Instrumentalist.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @person = Instrumentalist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @person = Instrumentalist.new(:country => "Switzerland")

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @person = Instrumentalist.find(params[:id])
  end

  def create
    @person = Instrumentalist.new(params[:instrumentalist])

    respond_to do |format|
      if @person.save
        format.html { redirect_to(instrumentalists_path, :notice => 'Instrumentalist wurde erstellt.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @person = Instrumentalist.find(params[:id])

    respond_to do |format|
      if @person.update_attributes(params[:instrumentalist])
        format.html { redirect_to(instrumentalists_path, :notice => 'Instrumentalist erfolgreich angepasst.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @person = Instrumentalist.find(params[:id])
    @person.destroy

    respond_to do |format|
      format.html { redirect_to(instrumentalists_url) }
    end
  end
end
