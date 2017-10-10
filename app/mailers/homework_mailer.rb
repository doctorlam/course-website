class HomeworkMailer < ApplicationMailer
	 default from: "chris.lam@unt.edu"
  
  	def sample_email(submission_user)
    	mail(to: submission_user.email, subject: 'Sample Email')
  end
end

