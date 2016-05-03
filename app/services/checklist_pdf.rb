class ChecklistPdf < Prawn::Document
  def initialize(checklist, view)
    super()
    @checklist = checklist
    @view = view

    text "President:"
    text "#{@checklist.president.name}"
  end
end
