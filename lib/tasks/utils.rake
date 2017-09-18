namespace :utils do
  desc "TODO"
  task seed: :environment do
    puts "Creating Contacts"
    100.times do |i|
      Contact.create!(
          name: Faker::Name.name, 
          email: Faker::Internet.email, 
          type: Type.all.sample, 
          rmk: Faker::Lorem.paragraph(2)
      )
    end
    puts "Created!"

    # Generate addresses
    puts "Creating Addresses"
    Contact.all.each do |contact|
      Address.create!(
          street: Faker::Address.street_address, 
          city: Faker::Address.city, 
          state: Faker::Address.state, 
          contact: contact
      )
    end
    puts "Created!"

    # Generate phones
    puts "Creating Phones"
    Contact.all.each do |contact|
      Random.rand(1..5).times do |i|
        Phone.create!(
            phone: Faker::PhoneNumber.cell_phone,
            contact: contact
        )
      end
    end
    puts "Created!"
  end

end
