class StaticPagesController < ApplicationController

  def index
    @render_result = params[:search]

    if @render_result
      flickr = Flickr.new ENV["key"], ENV["secret"]
      @photos = flickr.photos.search :user_id => static_pages_params[:id]
    end
  end

  def static_pages_params
    params.require(:search).permit(:id)
  end
end
