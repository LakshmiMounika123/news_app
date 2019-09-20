# frozen_string_literal: true

class CatalogsController < ApplicationController
  # To fetch data from Catalog model
  def index
    @catalogs = Catalog.all

    # respond_to do |format|
    #     format.json @catalogs
    # end

    # render json: {catalogs: @catalogs}

    render json: response_data('catalog', @catalogs), status: :ok
  end

  def create
    @catalog = Catalog.new(catalog_param)

    if @catalog.save
        render json: @catalog, status: "CREATED"
    else
      render status: "ERROR"
    end
  end


  def update
    @catalog = Catalog.find(params[:id])

    if @catalog.update_attributes(catalog_param)
      render json: @catalog, status: :ok
    else
      render json: {error: {message: 'Failed to update!'}}, status: :unprocessable_entity
    end
  end

  def destroy
    @catalog = Catalog.find(params[:id])

    if @catalog.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  def show

    @catalog = Catalog.find(params[:id])

    # @catalog = Catalog.where(id: params[:id]) || Catalog.where(ctype: params[:id])

    render json: @catalog, status: :ok
  end



  private

  def catalog_param
    params.require(:catalog).permit(:name,:ctype)
  end
end
