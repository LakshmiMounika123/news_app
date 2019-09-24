class CommentsController < ApplicationController

    before_action :set_comments

    # def index
    #     @comments = @article.comments.all
    #     render json: {comment: response_data('comments', @comments)},status: :ok
        
    # end

    def create
       @comment = @article.comments.new(comment_params)

       if @comment.save
        render json: {status: "SUCCESS", message: 'Comment is saved', data: @comment}, status: :ok
       else
        render json: {status: "ERROR", message: '@comment.errors.full_messages'}, status: :unprosessable
        end
    end

    def destroy
        @comment = @article.comments.find(params[:id])

        if @comment.destroy
           render json: {status:"successfully deleted"}, status: :ok
        else
            render json: {status:"unable to delete"}, status: :ok
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:url)
    end

    def set_comments
        @catalog = Catalog.find(params[:catalog_id])

        @article = @catalog.articles.find(params[:article_id])
    end
end
