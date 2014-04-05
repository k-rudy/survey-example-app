class UserMailer < ActionMailer::Base
  default from: "user@test.com"
  
  def survey_email(survey)
    @survey = survey

    mail(to: @survey.email,
         subject: "New survey received")
  end
end
