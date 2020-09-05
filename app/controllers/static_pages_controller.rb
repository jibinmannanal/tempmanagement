class StaticPagesController < ApplicationController

  def home
    if params[:seva_type_id].present?
        @sevas = Seva.where(status:"active",seva_type_id: params[:seva_type_id]).paginate(page: params[:page])
    else
        @sevas = Seva.where(status:"active").paginate(page: params[:page])
    end


    if logged_in?
      # @micropost  = current_user.microposts.build
      # @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
