class AdminsController < ApplicationController

    layout 'admin'

    def index
        @admin = Admin.all
    end

    def edit
        @admin = Admin.find(params[:id])
    end

    def create
        @admin = Admin.new(admin_params)
    
        if @admin.save
            redirect_to admins_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def update
        @admin = Admin.find(params[:id])
    
        if @admin.update(admin_params)
            redirect_to admins_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @admin = Admin.find(params[:id])

        if @admin.present?
            @admin.destroy 
        end
        redirect_to admins_path
    end

    def admin_params
        params.require(:admin).permit(:email, :password)
    end

end


