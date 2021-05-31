class UserMailer < ActionMailer::Base
  default from: "sender@example.com"
  def sendMail(email,user)
  @token = rand(100000...999999)
  @user = User.find(user.id)

  @user.update(token: @token)

  @greeting = "Hi"

  mail to: email, subject: "Verification Link"
  end
end