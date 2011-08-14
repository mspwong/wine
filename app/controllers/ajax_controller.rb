class AjaxController < ApplicationController

  def ajax_page
    render "ajax_page"
  end

  def get_wines
    respond_to do |format|
      format.json do
        wines = Wine.all
        return no_data_found if wines.blank?

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

  def no_data_found
    head :no_content
  end

  def find_wine_by_id
    respond_to do |format|
      format.json do
        begin
          wine = Wine.find(params[:id])
        rescue ActiveRecord::RecordNotFound
          return no_data_found
        end

        render :json => wine.to_json
      end
    end
  end


end