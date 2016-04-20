class ChecklistsController < ApplicationController
  before_action :set_collection_values, only: [:new, :create, :edit, :update]

  def index
    @checklist = current_user.checklist
    if @checklist.present?
      redirect_to edit_checklist_path(@checklist)
    else
      redirect_to new_checklist_path
    end
  end

  def show
    @checklist = current_user.checklist
  end

  def new
    if current_user.checklist.present?
      redirect_to edit_checklist_path(current_user.checklist) and return
    end

    @checklist = current_user.build_checklist
  end

  def create
    @checklist = current_user.build_checklist(checklist_params)

    if @checklist.save
      redirect_to @checklist
    else
      render :new
    end
  end

  def edit
    @checklist = current_user.checklist
  end

  def update
    @checklist = current_user.checklist

    if @checklist.update_attributes(checklist_params)
      redirect_to @checklist
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
