class ProposalMailer < ActionMailer::Base
  default from: 'UX Burlington <pete@agilion.com>'

  def confirmation(proposal_id)
    @proposal = Proposal.find(proposal_id)

    mail(
      to: "#{@proposal.user_name} <#{@proposal.user_email}>",
      subject: 'Thanks for submitting a proposal to UX Burlington!'
    )
  end
end
