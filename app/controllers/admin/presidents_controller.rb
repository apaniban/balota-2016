class Admin::PresidentsController < Admin::BaseController
  def index
    @presidents = President.all
  end

  def show
    @president = President.find(params[:id])
  end

  def new
    @president = President.new
    @parties = Party.all
  end

  def create
    @president = President.new(president_params)
    @parties = Party.all

    if @president.save
      redirect_to [:admin, @president]
    else
      render :new
    end
  end

  def edit
    @president = President.find(params[:id])
    @parties = Party.all
  end

  def update
    @president = President.find(params[:id])
    @parties = Party.all

    if @president.update_attributes(president_params)
      redirect_to [:admin, @president]
    else
      render :edit
    end
  end

  def destroy
    @president = President.find(params[:id])

    if @president.destroy
      redirect_to admin_presidents_path
    else
      redirect_to [:admin, @president]
    end
  end

  private
    def president_params
      params.require(:president).permit(:name, :ballot_name, :ballot_number, :party_id)
    end
end
