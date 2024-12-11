class ItemsController < ApplicationController
  before_action :set_event, only: [:create, :new, :index]
  # before_action :set_item

  def index
    @items = @event.items
  end

  def show
    @item = Item.find(params[:id])
    authorize @item
  end

  def new
    @item = Item.new
    authorize @item
  end

  def create
    @item = Item.new(item_params)
    @item.event = @event
    @item.user = current_user
    authorize @item
    if @item.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.append("items", partial: "items/item", locals: { item: @item }),
            turbo_stream.replace("new_item_form", partial: "items/form", locals: { event: @event })
          ]
        end
        format.html { redirect_to @event, notice: "Item ajouté avec succès !" }
      end
    else
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("new_item_form", partial: "items/form", locals: { event: @event }),
                 status: :unprocessable_entity
        end
        format.html { render "events/show", status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item = Item.find(params[:id])
    authorize @item
    @event = @item.event
    @item.destroy

    respond_to do |format|
      format.turbo_stream do
        # Turbo Stream remove the item row
        render turbo_stream: turbo_stream.remove("item_#{@item.id}")
      end
      format.html { redirect_to @event, notice: "L'item est bien supprimé" }
    end
  end

  private

  def item_params
    params.require(:item).permit(:content, :user_id, :event_id)
  end

  # def set_item
  #   @item = Item.find(params[:id])
  # end

  def set_event
    @event = Event.find(params[:event_id])
  end

end
