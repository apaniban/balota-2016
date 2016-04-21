class ChecklistsController < ApplicationController
  before_action :set_collection_values, only: [:edit, :update]

  def show
    @checklist = current_user.checklist
  end

  def edit
    @checklist = current_user.checklist
  end

  def update
    @checklist = current_user.checklist

    if @checklist.update_attributes(checklist_params)
      redirect_to checklist_path
    else
      render :edit
    end
  end

  private
    def set_collection_values
      @presidents = President.all
      @vice_presidents = VicePresident.all
      @senators = Senator.all
      @party_lists = PartyList.all
    end

    def checklist_params
      params.require(:checklist).permit(:president_id, :vice_president_id, :party_list_id, senator_ids: [])
    end
end
