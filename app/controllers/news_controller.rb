class NewsController < ApplicationController
  filter_access_to :all

  def index
    @news = News.all

    respond_to do |format|
      format.html
    end
  end

  def show
    @news = News.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def new
    @news = News.new

    respond_to do |format|
      format.js
    end
  end

  def edit
    @news = News.find(params[:id])
    
    respond_to do |format|
      format.js
    end
  end

  def create
    @news = News.new(params[:news])

    @news.user = current_user

    respond_to do |format|
      if @news.save
        format.html { redirect_to(:back, :notice => 'News was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @news = News.find(params[:id])

    respond_to do |format|
      if @news.update_attributes(params[:news])
        format.html { redirect_to(:back, :notice => 'News was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @news = News.find(params[:id])
    @news.destroy

    respond_to do |format|
      format.html { redirect_to(:back) }
    end
  end
end
