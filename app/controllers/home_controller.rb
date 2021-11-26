class HomeController < ApplicationController
    def index
        @posts = Post.order(:created_at)
        @categories = Category.order(:name)
    end
end
