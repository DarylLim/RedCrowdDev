class Admin::RewardsController < Admin::BaseController
  def pending
    @campaigns = Reward.pending

    respond_to do |format|
      format.html { render :index }
    end
  end

  def approved
    @campaigns = Reward.approved

    respond_to do |format|
      format.html { render :index }
    end
  end

  def rejected
    @campaigns = Reward.rejected

    respond_to do |format|
      format.html { render :index }
    end
  end

  def moderate
    @campaign = Reward.pending.find(params[:id])
    @moderator = RedCrowd::Admin::Campaign::Moderate.new campaign: @campaign
  end

  def submit
    @campaign = Reward.pending.find(params[:id])
    @moderator = RedCrowd::Admin::Campaign::Moderate.new campaign_params.merge(campaign: @campaign)

    respond_to do |format|
      if @moderator.moderate!
        format.html { redirect_to pending_admin_campaigns_path, notice: t("admin.notices.campaign.#{@campaign.status}") }
      else
        format.html { render :moderate }
      end
    end
  end


  private
    def campaign_params
      params.require(:campaign).permit(:approved, :rejection_reason)
    end
end
