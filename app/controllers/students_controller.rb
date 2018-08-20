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
        if logged_in?
            find_student
        else 
            redirect_to '/login'
        end 
    end 

    def update 
        find_student
        if @student.update(student_params)
            flash[:notice] = "Successfully updated student"
            redirect_to student_path(@student)
        else 
            flash[:notice] = @student.errors.full_messages 
            redirect_to edit_student_path
        end 
    end 

    def destroy
        if logged_in?
            Student.find(params[:id]).destroy
            flash[:notice] = "Successfully removed profile"
            redirect_to root_path
        else 
            redirect_to '/login'
        end 
    end 

    private 

    def student_params
        params.require(:student).permit(:name, :level, :category)
    end 

    def find_student
        @student = Student.find(params[:id])
    end 
end
