class UsersController < ApplicationController
    def new
      @user = User.new
    end

    def home
      @user = User.find(params[:id])
      if @user.employee != nil 
        redirect_to user_employee_index_path(@user.id)
      elsif @user.admin != nil
        redirect_to user_admin_index_path(@user.id)
      end
    end

    def create
      @user = User.new(user_params)

      if @user.save
        # redirect_to home_page_path(@user.id), notice: 'Thank you for signing up!'
        redirect_to verification_mail_send_path(@user), notice: 'Thank you for signing up!'
      else
        render :new
      end
    end

    def verification_mail_send
     @user = User.find(params[:id])

     UserMailer.sendMail(@user.email,@user).deliver # _later(wait_until: 30.seconds.from_now)

    end
    def verify_mail
      data = params[:token]
      @user = User.find_by(token: data)
      if @user != nil
        @user.update(verified: true)
        @message = "Verified Succesfully!"
        render "verify_mail"   #, :alert => 'Verified Succesfully!'
      else
        @message = "Invalid Credients!"
         render "verify_mail" #, notice: 'Thank you for signing up!'

      end
    end
    private
  
    def user_params
      params.require(:user).permit(:name, :email, :password_digest)
    end
end