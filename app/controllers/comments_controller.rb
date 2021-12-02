class PostsController < ApplicationController
    before_action :authenticate_admin!
    load_and_authorize_resource
    layout 'admin'
    def index
        @comments = Comment.order(:name)
    end

    def new
        get_var
        @comment = Comment.new
    end
    
    def create
        get_var
        @comment = Comment.new(comment_params)
        @comment.admin_id = current_admin.id # colocando o id do usuario atual, no campo admin_id do comment
        
    end

    def edit
        get_var
        @comment = Comment.find(params[:id])

    end

    def update
        get_var
        @comment = Comment.find(params[:id])
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
        @post = Post.find (params[:id])
    end

    def post_params
        params.require(:post).permit(:content)
    end

end
