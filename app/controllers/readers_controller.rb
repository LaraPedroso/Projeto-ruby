class ReadersController < ApplicationController
    before_action :authenticate_admin!
    load_and_authorize_resource
    layout 'admin'

    def index
        @readers = Reader.order(:name)
    end

    def new
        @readers = Reader.new
    end
    
    def create
        @reader = Reader.new(reader_params)
        
    end

    def edit
        @reader = Reader.find(params[:id])

    end

    def update
        @reader = Reader.find(params[:id])

    end

    def destroy
        @reader= Reader.find(params[:id])
        
        if @reader.present?
            @reader.destroy 
        end
        redirect_to readers_path
    end

    private

    def reader_params
        params.require(:reader).permit(:username, :email, :content)
    end

end
