class HomeworkMailer < ApplicationMailer

	 default from: "chris.lam@unt.edu"
  
  	def sample_email(user, submission)
  		@assignment = Assignment.all
  		@submission = submission
  		@user = user
    	mail(to: user.email, subject: 'TECM 4400: An assignment has been graded!')
  end
end

