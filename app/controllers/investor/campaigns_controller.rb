class Investor::CampaignsController < Investor::BaseController
  def new
    @form = RedCrowd::Investor::Campaign::Creator.new
  end

  def edit
    @campaign = Campaign.find(params[:id])
    @form = "RedCrowd::Investor::Campaign::#{@campaign.kind.camelize}".constantize.new(@campaign.attributes.merge(campaign: @campaign))
  end

  def show
    @campaign = Campaign.find(params[:id])

  end

  def create
    @form = RedCrowd::Investor::Campaign::Creator.new(params[:red_crowd_investor_campaign_creator])
    if @campaign = @form.save
      redirect_to action: :edit, id: @campaign.id
    else
      render :new
    end
  end

  def update
    @campaign = Campaign.find(params[:id])
    @form = "RedCrowd::Investor::Campaign::#{@campaign.kind.camelize}".constantize.new(params["red_crowd_investor_campaign_#{@campaign.kind}"].merge({campaign: @campaign}))
    if @form.save
      redirect_to investor_company_path(@form.campaign.company, tab: :campaigns)
    else
      render :edit
    end
  end
end
