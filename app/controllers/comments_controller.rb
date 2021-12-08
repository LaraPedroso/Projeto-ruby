class CommentsController < ApplicationController
    load_and_authorize_resource
    before_action :authenticate_admin!
    layout 'admin'
    
    def index
        @comments = Comment.order(:created_at)
        
    end

    def new
        @comment = Comment.new
        get_params
    end

    def create
        @comment = Comment.new(comment_params)
        get_params
        @comment.admin_id = current_admin.id

        
        if @comment.save
            respond_to do |format|
                format.js
                @comments = Comment.where(post_id: @comment.post_id).order(:created_at)
            end
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        
        if @comment.present?
            @comment.destroy 
        end
        redirect_to comments_path
    end
    
    private

    def get_params
        @admin = Admin
    end

    def comment_params
        params.require(:comment).permit(:content, :post_id, :comment_id)
    end
    
end