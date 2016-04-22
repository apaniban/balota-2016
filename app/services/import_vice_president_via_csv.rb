require 'csv'

class ImportVicePresidentViaCsv
  def initialize(file)
    @file = file
    @failed_rows = []
  end

  def import
    CSV.foreach(@file, headers: true).with_index do |row, i|
      party = Party.find_by(name: row['party'])
      vice_president = VicePresident.find_or_initialize_by(party: party, name: row['name'], ballot_number: row['ballot_number'],
                                ballot_name: row['ballot_name'])

      if vice_president.new_record? && !vice_president.save && !party.present?
        @failed_rows << i
      end
    end

    if @failed_rows.present?
      #TODO: Export rows that are not created to csv. For now, just print failed rows.
      puts "These rows failed to create: #{@failed_rows}"
    end
  end
end
