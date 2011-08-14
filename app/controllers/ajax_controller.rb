class AjaxController < ApplicationController

  def ajax_page
    render "ajax_page"
  end

  def get_wines
    respond_to do |format|
      format.json do
        wines = Wine.all
        return head :no_content if wines.blank?

        render :json => wines.to_json
      end
    end
  end

  def get_wine
    return find_wine_by_id
  end

  def post_wine
    return find_wine_by_id
  end

private

  def find_wine_by_id
    respond_to do |format|
      format.json do
        begin
          wine = Wine.find(params[:id])
        rescue ActiveRecord::RecordNotFound
          return head :no_content if wine.blank?
        end

        render :json => wine.to_json
      end
    end
  end


end