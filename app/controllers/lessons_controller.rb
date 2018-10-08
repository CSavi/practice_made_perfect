require 'pry'

class LessonsController < ApplicationController
    before_action :find_lesson, only: [:show, :destroy]
    before_action :set_student

    def index
        
        if params[:student_id]
            set_student
            @lessons = @student.lessons if @student
           
            @lesson = Lesson.find(params[:id]) if @lesson
            @comment = @lesson.comments.build if @lesson
            @comments = @lesson.comments if @lesson
            respond_to do |f|
                f.html { render :index }
                f.json { render json: @lesson.to_json(include: :comment)} 
            end 
        else 
         
            flash[:notice] = "All Students' Lessons"
            @lessons = Lesson.all
            @comment = @lesson.comments.build if @lesson
            @comments = @lesson.comments if @lesson
            respond_to do |f|
                f.html { render :index }
                f.json { render json: @lesson.to_json(include: :comment)} 
            end 
        end
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
        @lesson.student = @student if @student
        if @lesson.save
            flash[:notice] = "Lesson successfully saved"
            respond_to do |f|
                f.json {render :json => @lesson}
                f.html {redirect_to lesson_path(@lesson)}
            end
        else 
            flash[:notice] = "Please fill in all fields"
             render :new 
        end 
    end 

    def show 
        @comment = @lesson.comments.build
        @comments = @lesson.comments
        respond_to do |f|
            f.html { render :show }
            f.json { render json: @lesson.to_json(include: :comment) }
        end 
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

    def set_student
        @student = Student.find_by(id: params[:student_id])
    end

end
