class CommentsController < ApplicationController 

    
    def index 
        find_lesson
        @comments = @lesson.comments
        
        respond_to do  |f|
            f.html { render :index }
            f.json { render json: @comments.to_json }
        end 
    end 

    def create
        find_lesson
        @comment = @lesson.comments.build(comments_params)
        if @comment.save 
            respond_to do |f| 
                f.html { render :show, :layout => false }
                f.json { render json: @comment.to_json }
            end 
        end  
    end 


    def delete 
        # if @comment.instructor_id != current_user.id 
        #     redirect_to instructor_lessons_path(current_user), alert: "You may not delete this comment."
        # else
            @comment = Comment.find(params[:id])
            @comment.delete
            render json: @comment 
        # end
    end 


    private 

    def comments_params
        params.require(:comment).permit(:content)
    end 

    def find_lesson
        @lesson = Lesson.find(params[:lesson_id])
    end

end 