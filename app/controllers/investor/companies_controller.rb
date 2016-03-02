class Investor::CompaniesController < Investor::BaseController

  def index
    @companies = current_user.companies    
  end

  def show
    @company = current_user.companies.find(params[:id])
  end

  def edit
    @company = current_user.companies.pending.find(params[:id])
  end

  def update
    @company = current_user.companies.pending.find(params[:id])

    respond_to do |format|
      if @company.update_attributes(company_params)
        format.html {redirect_to investor_companies_path, notice: t("investor.notices.company.update")}
      else
        format.html { render :edit }
      end
    end

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
      params.require(:company).permit(:name, :logo, :logo_cache, :registration_number, :location, :contact, :website, :description,
                                      employees_attributes: [:id, :name, :biography, :position, :picture, :picture_cache, :_destroy],
                                      funding_histories_attributes: [:id, :kind, :amount, :date, :_destroy]
                                      )
    end
end
