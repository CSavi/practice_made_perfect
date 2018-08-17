class StudentsController < ApplicationController
    before_action :find_student, only: [:show, :udpate, :destroy]

    def index
        @students = Student.all 
    end 
    
    def new
        @student = Student.new 
    end 

    def create 
        if logged_in?
            @student = Student.new(student_params)
            if @student.save
                redirect_to student_path(@student)
            else 
                redirect_to new_student_path 
            end 
        else
            redirect_to '/login'
        end 
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
        params.require(:student).permit(:name, :level, :category)
    end 

    def find_student
        @student = Student.find(params[:id])
    end 
end
