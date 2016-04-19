class Admin::SenatorsController < Admin::BaseController
  def index
    @senators = Senator.all
  end

  def show
    @senator = Senator.find(params[:id])
  end

  def new
    @senator = Senator.new
    @parties = Party.all
  end

  def create
    @senator = Senator.new(senator_params)
    @parties = Party.all

    if @senator.save
      redirect_to [:admin, @senator]
    else
      render :new
    end
  end

  def edit
    @senator = Senator.find(params[:id])
    @parties = Party.all
  end

  def update
    @senator = Senator.find(params[:id])
    @parties = Party.all

    if @senator.update_attributes(senator_params)
      redirect_to [:admin, @senator]
    else
      render :edit
    end
  end

  def destroy
    @senator = Senator.find(params[:id])

    if @senator.destroy
      redirect_to admin_senators_path
    else
      redirect_to [:admin, @senator]
    end
  end

  private
    def senator_params
      params.require(:senator).permit(:name, :ballot_name, :ballot_number, :party_id)
    end
end
