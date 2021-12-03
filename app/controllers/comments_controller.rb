class CommentsController < ApplicationController
    load_and_authorize_resource
    layout 'admin'

    def index
        @comments = Comment.all
    end

    def new
        @comment = Comment.new
    end
    
    def create
        @comment = Comment.new(comment_params)
        @comment.admin_id = current_admin.id
        @comment.post_id = '1'
        if @comment.save
            puts "OOOOO"
        else
            puts "dkasdas"
        end
    end

    def destroy
        @comment = Comment.find(params[:id]) # pega o parametro id de comment
        
        if @comment.present?
            @comment.destroy 
        end
        
    end

    private

    def get_var
        @admin = Admin

    end

    def comment_params
        params.require(:comment).permit(:content, :post_id, :admin_id)
    end

end
