class ChecklistPdf < Prawn::Document
  def initialize(checklist, view)
    super()
    @checklist = checklist
    @view = view

    print_logo
    print_president
    print_vice_president
    print_senators
    print_partylist
  end

  def print_logo

  end

  def print_president
    text "President:"
    pad_bottom(20) {
      if @checklist.president.present?
        text "#{@checklist.president.name_with_ballot_number}"
      else
        text "Undecided"
      end
    }

    stroke_horizontal_rule
  end

  def print_vice_president
    move_down 20
    text "Vice President:"

    pad_bottom(20) {
      if @checklist.vice_president.present?
        text "#{@checklist.vice_president.name_with_ballot_number}"
      else
        text "Undecided"
      end
    }

    stroke_horizontal_rule
  end

  def print_senators
    move_down 20
    text "Senators:"

    pad_bottom(20) {
      @checklist.senators.each do |senator|
        text "#{senator.name_with_ballot_number}"
      end
    }

    stroke_horizontal_rule
  end

  def print_partylist
    move_down 20
    text "Partylist:"

    pad_bottom(20) {
      if @checklist.party_list.present?
        text "#{@checklist.party_list.name_with_ballot_number}"
      else
        text "Undecided"
      end
    }
  end
end
