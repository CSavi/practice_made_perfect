require 'pry'

class SessionsController < ApplicationController

    def new 
    end 

    def create
        if auth_hash
            raise auth_hash.inspect
            @instructor = Instructor.find_or_create_by_ominiauth(auth_hash)
            session[:user_id] = @instructor.id
            redirect_to instructor_path(@instructor)
        else
            @instructor = Instructor.find_by(email: params[:session][:email])
            if @instructor && @instructor.authenticate(params[:session][:password])
                session[:user_id] = @instructor.id 
                redirect_to instructor_path(@instructor)
            else 
                
                render :new
            end 
        end 
    end 

    def delete
        session.clear
        redirect_to '/'
    end 

    private 

    def auth_hash
        request.env["omniauth.auth"]
    end 
end
