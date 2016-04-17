class Admin::PartiesController < Admin::BaseController
  def index
    @parties = Party.all
  end

  def show
    @party = Party.find(params[:id])
  end

  def new
    @party = Party.new
  end

  def create
    @party = Party.new(party_params)

    if @party.save
      redirect_to [:admin, @party]
    else
      render :new
    end
  end

  def edit
    @party = Party.find(params[:id])
  end

  def update
    @party = Party.find(params[:id])

    if @party.update_attributes(party_params)
      redirect_to [:admin, @party]
    else
      render :edit
    end
  end

  def destroy
    @party = Party.find(params[:id])

    if @party.destroy
      redirect_to admin_parties_path
    else
      redirect_to [:admin, @party]
    end
  end

  private
    def party_params
      params.require(:party).permit(:name, :acronym)
    end
end
