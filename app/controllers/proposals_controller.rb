class ProposalsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:create]
  def create
    Proposal.create! proposal_params
    respond_to do |format|
      format.js { head :ok }
    end
  end

  private

  def proposal_params
    params.require(:proposal).permit(:name, :email, :phone, :message)
  end
end
