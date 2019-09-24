class GalleriesController < ApplicationController

    before_action :set_gallery

    def index
        @galleries = @catalog.galleries.all
        render json: {gallery: response_data('galleries', @galleries)}, status: :ok
    end

    def create
        if params.has_key?('gallery') and params.keys[0] == @catalog.ctype
        @gallery = @catalog.galleries.new(gallery_params)
            if @gallery.save
                render json: {status: "SUCCESS", message: 'Gallery is saved', data: @gallery}, status: :ok
            else
                render json: {status: "ERROR", message: '@gallery.errors.full_messages'}, status: unprosessable

            end
        else
            render json: {status: "ERROR", message: 'Type is not matched'}, status: :unprosessable
        end
    end

    def update
        @gallery = @catalog.galleries.find(params[:id])

        if @gallery.update_attributes(gallery_params)
            render json: {status: "SUCCESS", message: 'Gallery is updated', data: @gallery}, status: :ok
        else
            render json: {statis: "ERROR", message: '@gallery.errors.full_messages'}, status: unprosessable
        end
            
    end

    def destroy
        @gallery = @catalog.galleries.find(params[:id])

        if @gallery.destroy
            render json: {status:"successfully deleted"}, status: :ok
        else
            render json: { status:"unable to delete"}, status: :ok
        end

    end


    private

    def gallery_params
        params.require(:gallery).permit(:title,:description,:status)
    end

    def set_gallery
        @catalog = Catalog.find(params[:catalog_id])
    end
end
