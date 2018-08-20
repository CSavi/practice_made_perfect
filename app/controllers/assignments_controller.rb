class AssignmentsController < ApplicationController
    

    def index
        if logged_in?
            @instructor = Instructor.find_by(id: session[:user_id])
            if !params[:hour_type].blank?
                if params[:hour_type] == "Lesson"
                    @assignments = @instructor.assignments.most_lesson_hours
                elsif params[:hour_type] == "Lesson Planning"
                    @assignments = @instructor.assignments.most_lesson_planning_hours
                elsif params[:hour_type] == "Created"
                    @assignments = @instructor.assignments.recently_created
                else
                    @assignments = @instructor.assignments.recently_updated
                end 
            else 
                @assignments = Instructor.find(current_user.id).assignments 
            end 
        else 
            redirect_to '/login'
        end
    end 
    
    def new
        @assignment = Assignment.new 
    end 

    #nested association => instructors and assignments
    def create 
        if logged_in?
            assignment_instructor
            @assignment = @instructor.assignments.build(assignment_params)
            if @assignment.save 
                flash[:notice] = "Successfully saved new assignment"
                redirect_to instructor_assignment_path(@instructor, @assignment)
            else 
                flash[:notice] = @assignment.errors_full_messages
                render :new 
            end 
        else
            flash[:notice] = "Must be logged in to manage account"
            redirect_to '/login'
        end  
    end 

    def show 
        if logged_in?
            assignment_instructor
            @assignment = @instructor.assignments.find(params[:id])
            if !current_user.assignments.find{|assignment| assignment == @assignment}
                flash[:notice] = "Cannot view another instructor's assignments"
                redirect_to root_path
            end
        else 
            redirect_to '/login'
        end  
    end 

    def edit 
        assignment_instructor
        @assignment = @instructor.assignments.find(params[:id])
        if !current_user.find{|assignment| assignment == @assignment}
            flash[:notice] = "Cannot view another instructor's assignments"
            redirect_to root_path
        end
    end 

    def update 
        @assignment = @instructor.assignments.find(params[:id])
        if @assignment.update(assignment_params)
            flash[:notice] = "Successfully updated"
            redirect_to instructor_assignments_path(@instructor)
        else 
            flash[:notice] = @assignment.errors_full_messages
            redirect_to edit_instructor_assignment_path(@instructor, @assignment)
        end 
    end 

    def destroy
        if current_user
            assignment_instructor
            @assignment =  @instructor.assignments.find(params[:id])
            @assignment.destroy
            flash[:notice] = "Successfully removed assignment"
            redirect_to instructor_path(@instructor)
        else 
            redirect_to '/login'
        end 
    end 

    private 

    def assignment_params
        params.require(:assignment).permit(:title, :lesson_hours, :lesson_planning_hours)
    end 

    def find_assignment
        @assignment = Assignment.find(params[:id])
    end 

    def assignment_instructor
        @instructor = Instructor.find_by(params[:instructor_id])
    end 
end
