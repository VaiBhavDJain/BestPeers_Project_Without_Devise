class EmployeeSkillsController < ApplicationController

    def index
        @user = User.find(params[:user_id])
        @employee_skills = @user.employee_skills
      end
          
        def new
          @user = User.find(params[:user_id])
          @employee_skills = @user.employee_skills.new
        end
          
        def create
          @user = User.find(params[:user_id])
          data = add_skills
          data.each do |data|
            @user.employee_skills.create(skill_id: data)
          end
          redirect_to user_employee_skills_path(@user.id), vaibhav_flash: 'Skills Added Successfully'
        end

        def destroy
          @user = User.find(params[:user_id])
          @user.employee_skills.find(params[:id]).destroy
          redirect_to user_employee_skills_path(@user.id), success: 'Deleted Successfully'
        end
  
    private
    
    def add_skills
      obj = params[:skill_ids]
      obj.reject!(&:blank?)
      return obj
    end
end
