class AlbumsController < ApplicationController
  before_action :set_event
  before_action :set_album

  def index
    @album = @event.albums
  end

  def new
    
  end

  private

  def set_event
    @event = Event.find(params[event_id])
  end
  
  def set_album
    @album = Album.find(params[:id])
  end

end
