ActiveAdmin.register Proposal do
  permit_params :title, :abstract, :notes, :pitch, :user_id

  index do
    column :id
    column :title
    column :abstract
    column :notes
    column :pitch
    column :votes_round1
    column :votes_round2
    actions
  end

  csv do
    column :id
    column :title
    column :votes_round1
    column :votes_round2
  end

  form do |f|
    f.inputs :title, :abstract, :notes, :pitch, :user
    f.actions
  end

  batch_action :round2 do |selection|
    Proposal.where(id: selection).update_all(round2: true)
    redirect_to admin_proposals_url
  end
end
