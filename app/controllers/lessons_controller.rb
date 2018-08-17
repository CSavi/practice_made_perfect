class LessonsController < ApplicationController
    before_action :find_lesson, only: [:show, :udpate, :destroy]

    def index
        @lessons = Lesson.all 
    end 
    
    def new
        @lesson = Lesson.new 
    end 

    def create 
        if logged_in?
            @lesson = Lesson.new(lesson_params)
            if @lesson.save
                redirect_to lesson_path(@lesson)
            else 
                redirect_to new_lesson_path 
            end 
        else 
            redirect_to '/login'
        end 
    end 

    def show 
    end 

    def edit 
    end 

    def update 
    end 

    def destroy? #allow teachers to delete their lessons?
    end 

    private 

    def lesson_params
        params.require(:lesson).permit(:description, :lesson_datetime)
    end 

    def find_lesson
        @lesson = Lesson.find(params[:id])
    end 
end
