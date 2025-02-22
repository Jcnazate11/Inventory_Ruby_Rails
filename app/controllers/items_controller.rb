class ItemsController < ApplicationController
    def index
    @items = Item.all
    end

    def show
    @item = Item.find(params[:id])
    end

    def new
    @item = Item.new
    end

    def create
    @item = Item.new(item_params)
    if @item.save
        redirect_to @item
    else
        render :new
    end
    end

    def edit
    @item = Item.find(params[:id])
    end

    def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
        redirect_to @item
    else
        render :edit
    end
    end

    def destroy
        puts params.inspect
        @item = Item.find(params[:id])
        @item.destroy
        flash[:notice] = "Item '#{@item.name}' was successfully destroyed."
        redirect_to items_path
      end

    private

    def item_params
    params.require(:item).permit(:name, :description, :quantity)
    end
end