class AlbumsController < ApplicationController
  before_action :set_event
  before_action :set_album, only: [:edit, :update]

  def index
    @albums = @event.album
  end

  def show
    @album = Album.find(params[:id])
    authorize @album
  end

  def new
    if @event.album.present?
      redirect_to @event, alert: "Cet évènement a déjà un album."
    else
      @album = @event.build_album
    end
    authorize @album
  end

  def create
    @album = Album.new(album_params)
    @event = Event.find(params[:event_id])
    @album.event = @event
    authorize @album

    if @album.save
      redirect_to @event, notice: "Album créé avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @album = Album.find(params[:id])
    authorize @album
  end

  def update
    @album = Album.find(params[:id])
    authorize @album
    if params[:album][:media].present?
      params[:album][:media].each do |media|
        @album.media.attach(media)
      end
    end

    if @album.save
      redirect_to event_album_path(@album.event), notice: "Médias ajoutés avec succès à l'album."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def album_params
    params.require(:album).permit(media: [])
  end

  def set_album
    @album = @event.album
  end

end
