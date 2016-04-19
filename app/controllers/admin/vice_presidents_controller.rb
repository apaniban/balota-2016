class Admin::VicePresidentsController < Admin::BaseController
  def index
    @vice_presidents = VicePresident.all
  end

  def show
    @vice_president = VicePresident.find(params[:id])
  end

  def new
    @vice_president = VicePresident.new
    @parties = Party.all
  end

  def create
    @vice_president = VicePresident.new(vice_president_params)
    @parties = Party.all

    if @vice_president.save
      redirect_to [:admin, @vice_president]
    else
      render :new
    end
  end

  def edit
    @vice_president = VicePresident.find(params[:id])
    @parties = Party.all
  end

  def update
    @vice_president = VicePresident.find(params[:id])
    @parties = Party.all

    if @vice_president.update_attributes(vice_president_params)
      redirect_to [:admin, @vice_president]
    else
      render :edit
    end
  end

  def destroy
    @vice_president = VicePresident.find(params[:id])

    if @vice_president.destroy
      redirect_to admin_vice_presidents_path
    else
      redirect_to [:admin, @vice_president]
    end
  end

  private
    def vice_president_params
      params.require(:vice_president).permit(:name, :ballot_name, :ballot_number, :party_id)
    end
end
