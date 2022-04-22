class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.index.subject
  #
  def index
    @greeting = "Hi"

    def welcome_email
      mail(to: current_user.email, subject: 'Welcome to My Awesome Site')
    end
  end
end
