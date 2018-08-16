class InstructorsController < ApplicationController

    def index
        @instructors = Instructor.all 
    end 
    
    def new
        @instructor = Instructor.new 
    end 

    def create 
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

    def instructor_params
        params.require(:instructor).permit(:name,)
    end 

    def find_instructor
        @instructor = Instructor.find(params[:id])
    end 
end
