#encoding: utf-8
class ComposersController < ApplicationController
  
  def index
    @composers = Composer.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @composers }
    end
  end

  def new
    @composer = Composer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @composer }
    end
  end


  def edit
    @composer = Composer.find(params[:id])
  end

  def create
    @composer = Composer.new(params[:composer])

    respond_to do |format|
      if @composer.save
        format.html { redirect_to( composers_path, :notice => 'Komponist wurde erfolgreich erstellt.') }
        format.xml  { render :xml => @composer, :status => :created, :location => @composer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @composer.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @composer = Composer.find(params[:id])

    respond_to do |format|
      if @composer.update_attributes(params[:composer])
        format.html { redirect_to(composers_path, :notice => 'Komponist wurde erfolgreich angepasst.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @composer.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @composer = Composer.find(params[:id])
    @composer.destroy

    respond_to do |format|
      format.html { redirect_to(composers_url, :notice => "Komponist gelöscht.") }
      format.xml  { head :ok }
    end
  end
  
  
end
