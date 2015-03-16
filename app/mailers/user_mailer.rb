class UserMailer < ActionMailer::Base
  default from: 'andoidxx@gmail.com'

  def welcome_email()
      # @user = user
      @url  = 'http://example.com/login'
      mail( to: "igor.kalashniuk@gmail.com",
            subject: 'Registration at Autogroup.sk')
  end

  def new_user(user)
    @user  = user
    mail( subject: 'new user registration',
          to: "igor.kalashniuk@gmail.com" )
  end

end
