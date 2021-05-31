class AdminController < ApplicationController
    def index

        @user = User.find(params[:user_id])
  
        if @user.admin == nil
          redirect_to new_user_admin_path(@user.id)
        else
          @admin_id = @user.admin.id
          @employee = Employee.all
          render('index')
        end
      end
       
        def show
          @user = User.find(params[:user_id])

          @admin = Admin.find(params[:id])
        end
          
        def new
         
          @user = User.find(params[:user_id])
          @admin = @user.build_admin
        end
          
        def create
         
          @user= User.find(params[:user_id])
          @admin = @user.build_admin(admin_params)

          if @admin.save 
             redirect_to user_admin_path(@user.id, @admin.id), vaibhav_flash: 'Admin successfully created.'
          else
              render('new')
          end
          
        end
  
          
        def edit
         
          @user = User.find(params[:user_id])
          @admin = Admin.find(params[:id])
        end
        def update
          @user = User.find(params[:user_id])

          if @user.update(update_admin_params)

            redirect_to user_admin_path
          else
              render('edit')
          end
        end
          
        def delete
         
          @user = User.find(params[:user_id])
          @admin = Admin.find(params[:id])
        end
        def destroy
          @admin = Admin.find(params[:id])
          @user_id = @admin.user_id
          @admin.destroy
          redirect_to home_page_path(@user_id)
        end

       def new_skills
        @user = User.find(params[:user_id])
        @admin = Admin.find(params[:admin_id])
        @skill = Skill.new
       end

       def add_skills
         @skill = Skill.new(skill_params)
  
         if @skill.save 
           redirect_to user_admin_index_path, success: 'Skill Successfully added'
         else
           render('new_skills')
        end
       end

    private
    def admin_params  
      params.require(:admin).permit(:first_name,:last_name,:dob,:mob_no,:address,:image)
    end

  def update_admin_params
    params.require(:user).permit(:name,:email, admin_attributes: [:first_name, :last_name, :dob, :mob_no, :address, :image])
  end

  def skill_params
    params.require(:skill).permit(:name)
  end
end
