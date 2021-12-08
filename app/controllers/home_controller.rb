class HomeController < ApplicationController
    def index
        @posts = Post.order(:created_at)
        @categories = Category.order(:name)
    end

    def post
        @post = Post.find(params[:id])
        @admin = Admin.find(params[:id])
        @comment = Comment.new
        @comments = Comment.where(post_id: @post.id)
        @comment_son = Comment.new

    end
end
