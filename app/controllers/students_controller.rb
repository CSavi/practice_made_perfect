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
            student_instructor
            @student = @instructor.students.build(student_params)
            if @student.save
                flash[:notice] = "Successfully saved new student"
                redirect_to student_path(@student)
            else 
                render :new
            end 
        else
            redirect_to '/login'
        end 
    end 


    def show 
        find_student
        @lessons = Lesson.all
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
            redirect_to edit_student_path
        end 
    end 

    def destroy
        if current_user
            Student.find(params[:id]).destroy
            flash[:notice] = "Successfully removed profile"
            redirect_to students_path
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

    def student_instructor
        @instructor = Instructor.find_by(params[:instructor_id])
    end 
end
