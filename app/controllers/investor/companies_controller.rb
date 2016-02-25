class Investor::CompaniesController < Investor::BaseController

  def index
    @companies = current_user.companies    
  end

  def show
    
  end

  def new
    @company = Company.new
  end

  def create
    @company = current_user.companies.build company_params

    respond_to do |format|
      if @company.save
        format.html {redirect_to investor_companies_path, notice: t("investor.notices.company.create")}
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @company = current_user.companies.find(params[:id])
    @company.destroy
    redirect_to investor_companies_path, notice: t("investor.notices.company.destroy")
  end

  private
    def company_params
      params.require(:company).permit(:name)
    end
end
