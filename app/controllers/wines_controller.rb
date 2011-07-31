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
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @wine }
    end
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
  def edit
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
