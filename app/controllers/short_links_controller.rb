class ShortLinksController < ApplicationController

  def redirect
  url = ShortLink.find_by(short_url_path: params[:path])
    if url
      redirect_to url.orig_url
    else
      redirect_to root_path, notice: "Sorry can't find that!"
    end
  end

end
