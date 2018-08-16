class AssignmentsController < ApplicationController

    def index
        @assignments = Assignment.all 
    end 
    
    def new
        @assignment = Assignment.new 
    end 

    def create 
    end 

    def show 
        find_assignment
    end 

    def edit 
    end 

    def update 
    end 

    def destroy
    end 

    private 

    def assignment_params
        params.require(:assignment).permit(:name,)
    end 

    def find_assignment
        @assignment = Assignment.find(params[:id])
    end 
end
