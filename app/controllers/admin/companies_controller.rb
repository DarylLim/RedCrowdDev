class Admin::CompaniesController < Admin::BaseController
  def pending
    @companies = Company.pending

    respond_to do |format|
      format.html { render :index }
    end
  end

  def approved
    @companies = Company.approved

    respond_to do |format|
      format.html { render :index }
    end
  end

  def moderate
    @company = Company.pending.find(params[:id])
  end

  def submit
    @company   = Company.pending.find(params[:id])
    @moderator = RedCrowd::Admin::Company::Moderate.new company_params.merge(company: @company)

    respond_to do |format|
      if @moderator.moderate!
        format.html { redirect_to pending_admin_companies_path, notice: t("admin.notices.company.#{@company.status}") }
      else
        format.html { render :moderate }
      end
    end
  end


  private
    def company_params
      params.require(:company).permit(:approved, :rejection_reason) 
    end
end
