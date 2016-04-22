require 'csv'

class ImportPartylistViaCsv
  def initialize(file)
    @file = file
    @failed_rows = []
  end

  def import
    CSV.foreach(@file, headers: true).with_index do |row, i|
      partylist = PartyList.find_or_initialize_by(row.to_hash)

      if partylist.new_record? && !partylist.save
        @failed_rows << i
      end
    end

    if @failed_rows.present?
      #TODO: Export rows that are not created to csv. For now, just print failed rows.
      puts "These rows failed to create: #{@failed_rows}"
    end
  end
end
