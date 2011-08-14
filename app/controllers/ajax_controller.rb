class AjaxController < ApplicationController

  def ajax_page
    render "ajax_page"
  end

  def get_wines
    respond_to do |format|
      format.json do
        wines = Wine.all
        render :json => wines.to_json
      end
    end
  end

end