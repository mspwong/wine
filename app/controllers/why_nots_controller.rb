class WhyNotsController < ApplicationController

  def ajax_page
    render "ajax_page"
  end

  def ajax_this
    respond_to do |format|
      format.json do
        wines = Wine.all
        render :json => wines.to_json
      end
    end
  end

end