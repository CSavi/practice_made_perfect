require 'pry'

class LessonsController < ApplicationController
    before_action :find_lesson, only: [:show, :udpate, :destroy]

    def index
        @lessons = Lesson.all 
    end 
    
    def new
        @lesson = Lesson.new 
        @students = Student.all
        @instructors = Instructor.all
    end 

    def create 
      @lesson = Lesson.new(lesson_params)
        if @lesson.save
             flash[:notice] = "Lesson successfully saved"
             redirect_to lesson_path(@lesson)
        else 
             redirect_to new_lesson_path 
        end 
    end 

    def show 
    end 

    def edit 
        if current_user
            find_lesson
            @students = Student.all
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
            render :edit 
        end 
    end 

    # def destroy? #for future, admin privileges will be required to allow teachers to delete their lessons
    # end 

    private 

    def lesson_params
        params.require(:lesson).permit(:description, :lesson_datetime, :student_id, :instructor_id)
    end 


    def find_lesson
        @lesson = Lesson.find(params[:id])
    end 
end
