require 'pry'

class SessionsController < ApplicationController

    def new 
    end 

    def create
        if auth_hash
            @instructor = Instructor.find_or_create_by(uid: auth_hash[:uid]) do |instructor|
                instructor.password = SecureRandom.hex
                instructor.name = auth_hash[:info][:name]
        end 
            session[:user_id] = @instructor.id
            redirect_to instructor_path(@instructor)
        else
            @instructor = Instructor.find_by(email: params[:session][:email])
            if @instructor && @instructor.authenticate(params[:session][:password])
                session[:user_id] = @instructor.id 
                redirect_to instructor_path(@instructor)
            else 
                flash[:alert] = "Invalid credentials. Please try again or signup to create account."
                render :new
            end 
        end 
    end 

    def delete
        session.clear
        redirect_to root_path
    end 

    private 

    def auth_hash
        request.env["omniauth.auth"]
    end 
end
