class ChecklistPdf < Prawn::Document
  def initialize(checklist, view)
    super()
    @checklist = checklist
    @view = view
    @checkmark = "#{Rails.root}/app/assets/images/round_checkmark.png"

    font_size 10

    print_logo
    print_president
    print_vice_president
    print_senators
    print_partylist
  end

  def print_logo
    logopath = "#{Rails.root}/app/assets/images/logo_pdf.png"
    image logopath, width: 200, height: 32, position: :center

    move_down 20
  end

  def print_president
    print_position { text "My President" }
    pad_bottom(20) {
      print_candidate do
        if @checklist.president.present?
          text "#{@checklist.president.name_with_ballot_number}"
        else
          print_undecided
        end
      end
    }
  end

  def print_vice_president
    move_down 10
    print_position { text "My Vice President" }

    pad_bottom(20) {
      print_candidate do
        if @checklist.vice_president.present?
          text "#{@checklist.vice_president.name_with_ballot_number}"
        else
          print_undecided
        end
      end
    }
  end

  def print_senators
    move_down 10
    print_position { text "My Senators" }

    pad_bottom(20) {
      if @checklist.senators.present?
        @checklist.senators.each do |senator|
          pad(5) {
            print_candidate do
              text "#{senator.name_with_ballot_number}"
            end
          }
        end
      else
        print_undecided
      end
    }
  end

  def print_partylist
    move_down 10
    print_position { text "My Partylist" }

    pad_bottom(20) {
      print_candidate do
        if @checklist.party_list.present?
          text "#{@checklist.party_list.name_with_ballot_number}"
        else
          print_undecided
        end
      end
    }
  end

  def print_position
    font('Helvetica', size: 12, style: :bold) { yield }
  end

  def print_candidate
    @current_y_position = self.cursor
    image @checkmark, width: 20, height: 20
    bounding_box([30, @current_y_position - 5], width: 300) do
      yield
    end
  end

  def print_undecided
    bounding_box([30, self.cursor - 5], width: 300) do
      font('Helvetica', style: :italic) { text 'Undecided' }
    end
  end
end
