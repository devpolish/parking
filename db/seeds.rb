# frozen_string_literal: true

# Create 100 ramdon owners
100.times do
  params = { 
             name: Faker::Name.unique.name, 
             document_type: Owner.document_types.keys.sample,
             document: Faker::IDNumber.unique.spanish_citizen_number
           }
  Owner.create(params)
end
