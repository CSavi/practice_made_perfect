class InstructorsController < ApplicationController
    before_action :find_instructor, only: [:udpate]

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
        if logged_in?
            find_instructor
           # render json: @instructor, status: 200
        else 
            redirect_to root_path
        end 
    end 

    def edit 
        find_instructor
        if !current_user
            redirect_to root_path
        end 
    end 

    def update 
        find_instructor
        if @instructor.update(instructor_params)
            flash[:notice] = "Successfully updated profile"
            redirect_to instructor_path(@instructor)
        else 
            flash[:alert] = @instructor.errors.full_messages
            render :edit 
        end
    end 

    def destroy
        if current_user
            find_instructor.destroy
            flash[:notice] = "Successfully deleted profile"
            session.delete :user_id
            redirect_to instructors_path
        else 
            redirect_to '/login'
        end 
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
