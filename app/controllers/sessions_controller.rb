require 'pry'

class SessionsController < ApplicationController

    def new 
    end 

    def create
        if auth 
            
            

        @instructor = Instructor.find_or_create_by(name: params[:instructor][:name])

        if @instructor && @instructor.authenticate(params[:instructor][:password])
            session[:user_id] = @instructor.instructor.id 
            redirect_to instructor_path(@instructor)
        else 
            flash[:notice] = "Invalid Login"
            render :new 
        end 
    end 

    def logout
        session.clear
        redirect_to root_path
    end 

    def auth
        request.env["omniauth.auth"]
    end 
end
