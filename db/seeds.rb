#Create admin

unless Admin.find_by(email: 'test@email.com').present?
  admin = Admin.create(email: 'test@email.com', name: 'admin', password: 'password')
  puts "Admin with email: #{admin.email} created."
end


#Create party
party_csv_file = Rails.root.join('lib', 'seeds', 'parties.csv')

parties = ImportPartyViaCsv.new(party_csv_file).import

puts "Parties created."

#Create partylist
partylist_csv_file = Rails.root.join('lib', 'seeds', 'partylists.csv')

partylists = ImportPartylistViaCsv.new(partylist_csv_file).import

puts "Partylists created."

#Create presidents
president_csv_file = Rails.root.join('lib', 'seeds', 'presidents.csv')

presidents = ImportPresidentViaCsv.new(president_csv_file).import

puts "Presidents created."

#Create vice presidents
vp_csv_file = Rails.root.join('lib', 'seeds', 'vice_presidents.csv')

vice_presidents = ImportVicePresidentViaCsv.new(vp_csv_file).import

puts "Vice presidents created."

#Create senators
senator_file = Rails.root.join('lib', 'seeds', 'senators.csv')

senators = ImportSenatorViaCsv.new(senator_file).import

puts "Senators created."
