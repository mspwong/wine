class UsersController < ApplicationController

  before_filter :find_user, :only => [:index, :show, :new, :create, :edit, :update, :destroy, :activate]

  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # toggle user's active attribute
  def activate
    active = @user.active
    @user.update_attribute(:active, !active)

    redirect_to user_url(:id => params[:id])
  end

  private

  def find_user
    @user = User.find(params[:id])
    @reviews = @user.reviews
  end

end