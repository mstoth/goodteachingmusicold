class UserMailer < ActionMailer::Base
  default from: "michael@virtualpianist.com"

  def approval_email(piece)
    @piece = piece
    mail(to: 'michael@virtualpianist.com', subject: 'Approval needed for piece.')
  end

end
