class WinesController < ApplicationController

  before_filter :find_wine, :only => [:show, :edit, :update, :destroy]

  # GET /wines
  # GET /wines.xml
  def index
    @wines = Wine.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @wines }
    end
  end

  # GET /wines/1
  # GET /wines/1.xml
  def show
    #respond_to do |format|
    #  format.html # show.html.erb
    #  format.xml  { render :xml => @wine }
    #end

    #render "show"
    #render :action => "show"

    #render :nothing => true
    #@foo = "wee"
    #render "goo"
    #render "users/moo", :status => 501
    #render :file => "/Users/mwong/workspace/husky/app/views/hee"
    #render :text => "hi", :layout => true, :status => 500
    #render :text => "hi", :layout => 'alternative', :status => 500
    #render :xml => @wine
    #render :js => "alert('hey there');"         # TODO:  behaves like render :text despite rails guide.  breaks MVC separate anyway
    #render :update do |page|                   # TODO:  behaves like render :text despite rails guide.  breaks MVC separate anyway
    #  page.replace_html 'warning', "Invalid options supplied"
    #end
    #render :json => @wine
    #render :xml => @wine
    #render :file => "/Users/mwong/foo.txt", :content_type => 'text/html', :layout => 'alternative'
    #render :file => "/Users/mwong/answer.png", :content_type => 'image/png'
    #render :file => "answer.png", :location => "/Users/mwong", :content_type => 'image/png'
    #render :file => "answer.png", :content_type => 'image/png'       # location is relative to this file under .../apps/views
    #render :file => "wines/foo.xls", :content_type => 'application/ms-excel'

    #redirect_to :action => "index"

    #head :bad_request
    #head :error
    #head :created, :location => edit_wine_path(Wine.all.last)
  end

  # GET /wines/new
  # GET /wines/new.xml
  def new
    @wine = Wine.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @wine }
    end
  end

  # GET /wines/1/edit
  # GET /wines/1/edit.xml
  def edit
    respond_to do |format|
      format.html { render :layout => 'alternative' }
      format.xml { render :xml => @wine }
    end
  end

  # POST /wines
  # POST /wines.xml
  def create
    @wine = Wine.new(params[:wine])

    respond_to do |format|
      if @wine.save
        format.html { redirect_to(@wine, :notice => 'Wine was successfully created.') }
        format.xml  { render :xml => @wine, :status => :created, :location => @wine }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @wine.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /wines/1
  # PUT /wines/1.xml
  def update
    respond_to do |format|
      if @wine.update_attributes(params[:wine])
        format.html { redirect_to(@wine, :notice => 'Wine was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @wine.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /wines/1
  # DELETE /wines/1.xml
  def destroy
    @wine.destroy

    respond_to do |format|
      format.html { redirect_to(wines_url) }
      format.xml  { head :ok }
    end
  end

  private

  def find_wine
    @wine = Wine.find(params[:id])
  end
end
