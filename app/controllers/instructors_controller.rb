class InstructorsController < ApplicationController
    before_action :require_login, only: [:index]
    before_action :find_instructor, only: [:show, :udpate, :destroy]

    def index
        @instructors = Instructor.all 
    end 
    
    def new  
      @instructor = Instructor.new 
    end 

    def create 
        @instructor = Instructor.new(instructor_params)
        if @instructor.save
            session[:user_id] = @instructor.id
            redirect_to instructor_path(@instructor)
        else 
            render '/instructors/new'
        end 
    end 

    def show
        find_instructor
    end 

    def edit 
    end 

    def update 
    end 

    def destroy
    end 

    private 

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end 

    def instructor_params
        params.require(:instructor).permit(:name, :category, :email, :password, :password_confirmation)
    end 

    def find_instructor
        @instructor = Instructor.find(params[:id])
    end 
end
