class ReviewsController < ApplicationController

  before_filter :find_wine, :only => [:index, :show, :new, :create, :edit, :update, :destroy]
  before_filter :find_review, :only =>  [:edit, :update, :destroy]

  def index
    @reviews = @wine.reviews
  end

  def show
    @review = @wine.reviews.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = @wine.reviews.build(params[:review])
    @review.user = User.find_by_email "mary@abc.com"      # TODO: add support for user entering user info
    if @review.save
      redirect_to wine_review_url(@wine, @review)
    else
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @review.update_attributes(params[:review])
      redirect_to wine_review_url
    else
      render :action => :edit
    end
  end

  def destroy
     @review.destroy

    respond_to do |format|
      format.html {redirect_to wine_reviews_path(@wine)}
      format.xml {head :ok}
    end
  end

  private

  def find_wine
    @wine = Wine.find(params[:wine_id])
  end

  def find_review
    @review = @wine.reviews.find(params[:id])
  end

end
