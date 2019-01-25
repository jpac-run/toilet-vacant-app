class ToiletsController < ApplicationController
  def index
    @toilets = Toilet.all
  end

  def get_in
    toilet = Toilet.find(params[:id])
    toilet.open = false
    if toilet.save
      ActiveSupport::Notifications.instrument "occupied.toilet"
      redirect_to root_path
    end
  end

  def get_out
    toilet = Toilet.find(params[:id])
    toilet.open = true
    if toilet.save
      ActiveSupport::Notifications.instrument "vacant.toilet"
      redirect_to root_path
    end
  end
end
