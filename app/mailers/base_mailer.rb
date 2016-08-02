class BaseMailer < ActionMailer::Base
  default from: "\"GeekDev\" <info@geekdev.ru>"

  def inform(proposal)
    @proposal = proposal
    mail(to: 'geekdev@mail.ru', subject: 'Новое обращение')
  end

end