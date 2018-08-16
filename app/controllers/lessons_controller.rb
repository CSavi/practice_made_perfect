class LessonsController < ApplicationController

    def index
        @lessons = Lesson.all 
    end 
    
    def new
        @lesson = Lesson.new 
    end 

    def create 
    end 

    def show 
        find_lesson
    end 

    def edit 
    end 

    def update 
    end 

    def destroy? #allow teachers to delete their lessons?
    end 

    private 

    def lesson_params
        params.require(:lesson).permit(:name,)
    end 

    def find_lesson
        @lesson = Lesson.find(params[:id])
    end 
end
