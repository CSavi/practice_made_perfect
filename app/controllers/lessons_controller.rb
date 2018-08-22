require 'pry'

class LessonsController < ApplicationController
    before_action :find_lesson, only: [:show, :destroy]

    def index
        @lessons = Lesson.all 
    end 
    
    def new
        if !logged_in?
            redirect_to '/login'
        else 
            @lesson = Lesson.new 
            @students = Student.all
            @instructors = Instructor.all
        end 
    end 

    def create 
        lesson_instructor
        @lesson = @instructor.lessons.build(lesson_params)
        if @lesson.save
            flash[:notice] = "Lesson successfully saved"
            redirect_to lesson_path(@lesson)
        else 
            flash[:notice] = "Please fill in all fields"
             redirect_to new_lesson_path 
        end 
    end 

    def show 
        find_lesson
    end 

    def edit 
        if current_user
            find_lesson
        else
            redirect_to '/login'
        end 
    end 

    def update 
        find_lesson
        if @lesson.update(lesson_params)
            flash[:notice] = "Successfully updated"
            redirect_to lesson_path(@lesson)
        else 
            flash[:notice] = "Cannot edit another instructor's lesson"
            redirect_to edit_lesson_path 
        end 
    end 

    def destroy
        if current_user
            find_lesson
            @lesson.destroy
            flash[:notice] = "Successfully removed lesson"
            redirect_to lessons_path
        else 
            redirect_to '/login'
        end 
    end 

    private 

    def lesson_params
        params.require(:lesson).permit(:description, :lesson_datetime, :student_id, :instructor_id)
    end 


    def find_lesson
        @lesson = Lesson.find(params[:id])
    end 

    def lesson_instructor
        @instructor = Instructor.find_by(id: session[:user_id])
    end 
end
