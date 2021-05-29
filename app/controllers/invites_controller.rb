class InvitesController < ApplicationController
  def new
  	insert_setup
  	@invite = Invite.new
  end
end
