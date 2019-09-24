class ArticlesController < ApplicationController

    before_action :set_articles

    def index
        # @article = Catalog.find(params[:catalog_id])

        @articles = @catalog.articles.all

        render json: {article: response_data('articles', @articles)}, status: :ok
        # render json: {articles: @articles}  
    end

    def create
        # @catalog = Catalog.find(params[:catalog_id])
        if params.has_key?('article') and params.keys[0] == @catalog.ctype

            # Rails.logger.debug "\n Yes I am in IF Condition #{params.keys[0].inspect} \n"

            @article = @catalog.articles.new(articles_params)
            if @article.save
                render json: {status: "SUCCESS", message: 'Article is saved', data: @article}, status: :ok
            else
                render json: {status: "ERROR", message: '@article.errors.full_messages'}, status: unprosessable
            end
        else
            render json: {status: "ERROR", message: 'Type is not matched'}, status: :unprosessable
        end

    end

    def update
        # @catalog =  Catalog.find(params[:catalog_id])
        @article =  @catalog.articles.find(params[:id])

        if @article.update_attributes(articles_params)
            render json: {status: "SUCCESS", message: 'Article is updated', data: @article}, status: :ok
        else
            render json: {status: "ERROR"}, status: :unprosessable
        end
    end

    def destroy
        # @catalog = Catalog.find(params[:catalog_id])
        @article = @catalog.articles.find(params[:id])

        if @article.destroy
            render json: {status:"successfully deleted"}, status: :ok
        else
            render json: {status:"unable to delete"}, status: :ok
        end
    end

    def show
        # @catalog = Catalog.find(params[:catalog_id])
        @article = @catalog.articles.find(params[:id])

        @comment = @article.comments.includes(comments:[:comments])
        render json: @comment


        # @comment = @article.comments.all
        # comment = {}
        # comment[:article] = @article
        # comment[:comments] = response_data('comments', @comment)
        # render json: comment


        # render json: @comment.includes(comments:[:comment])

        # render json: {status: "SUCCESS", data: @article}, status: :ok
    end

    private

    def articles_params
        params.require(:article).permit(:title,:short_description,:long_description,:status)
    end

    def set_articles
        @catalog = Catalog.find(params[:catalog_id])
    end
end
