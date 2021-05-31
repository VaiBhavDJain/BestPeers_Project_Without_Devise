class EmployeeController < ApplicationController

    def index
      @user = User.find(params[:user_id])

      if @user.employee == nil
        redirect_to new_user_employee_path(@user.id)
      else
          @employee_id = @user.employee.id
          render('index')
      end
    end
     
      def show

        @user = User.find(params[:user_id])
        @employee = Employee.find(params[:id])
      end
        
      def new
        @user = User.find(params[:user_id])
        @employee = @user.build_employee
      end
        
      def create
        @user= User.find(params[:user_id])
       
        @employee = @user.build_employee(create_employee_params)

        if @employee.save 
           redirect_to user_employee_path(@user.id,@employee.id), vaibhav_flash: 'Employee successfully created.'
        else
            render('new')
        end
        
      end

        
      def edit
        @user = User.find(params[:user_id])
        @employee = Employee.find(params[:id])
      end
      def update

        @user = User.find(params[:user_id])
        
        if @user.update(update_employee_params)

          redirect_to user_employee_path
        else
            render('edit')
        end
      end
        
      def delete
        @user = User.find(params[:user_id])
        @employee = Employee.find(params[:id])
      end
      def destroy
        @employee = Employee.find(params[:id])

        @user_id = @employee.user_id
        @employee.destroy
        redirect_to home_page_path(@user_id)
      end

  private
  def create_employee_params
    params.require(:employee).permit(:first_name,:last_name,:dob,:mob_no,:address,:image)
  end

  def update_employee_params
    params.require(:user).permit(:name,:email, employee_attributes: [:first_name, :last_name, :dob, :mob_no, :address, :image])
  end
end

# params[:employee][:user].permit(:email) to permit email field