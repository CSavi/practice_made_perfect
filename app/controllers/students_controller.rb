class StudentsController < ApplicationController

    def index
        @students = Student.all 
    end 
    
    def new
        @student = Student.new 
    end 

    def create 
    end 

    def show 
        find_student
    end 

    def edit 
    end 

    def update 
    end 

    def destroy
    end 

    private 

    def student_params
        params.require(:student).permit(:name,)
    end 

    def find_student
        @student = Student.find(params[:id])
    end 
end
