class Admin::PartyListsController < Admin::BaseController
  def index
    @party_lists = PartyList.all
  end

  def show
    @party_list = PartyList.find(params[:id])
  end

  def new
    @party_list = PartyList.new
  end

  def create
    @party_list = PartyList.new(party_list_params)

    if @party_list.save
      redirect_to [:admin, @party_list]
    else
      render :new
    end
  end

  def edit
    @party_list = PartyList.find(params[:id])
  end

  def update
    @party_list = PartyList.find(params[:id])

    if @party_list.update_attributes(party_list_params)
      redirect_to [:admin, @party_list]
    else
      render :edit
    end
  end

  def destroy
    @party_list = PartyList.find(params[:id])

    if @party_list.destroy
      redirect_to admin_party_lists_path
    else
      redirect_to [:admin, @party_list]
    end
  end

  private
    def party_list_params
      params.require(:party_list).permit(:name, :acronym, :ballot_number)
    end
end
