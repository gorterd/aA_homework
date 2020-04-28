class UserMailer < ApplicationMailer
    default from: "friendly alien <friendly_alien@gmail.com>"

    def welcome_user(user)
        @user = user
        
        mail(to: ["kanye@good.org", "kendrick@tde.io"], cc: "bernie@2020.com", subject: "you're in")
    end
end
