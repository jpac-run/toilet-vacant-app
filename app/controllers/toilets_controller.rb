class ToiletsController < ApplicationController
  def index
    @toilets = Toilet.all
  end

  def update
    toilet = Toilet.find(params[:id])
    toilet.open = !toilet.open
    
    toilet.save
    
    ActiveSupport::Notifications.instrument(select_event(toilet))
    redirect_to root_path
  end

  private

  def select_event(toilet)
    toilet.open ? "vacant.toilet" : "occupied.toilet"
  end
end
