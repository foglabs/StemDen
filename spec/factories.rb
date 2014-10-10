FactoryGirl.define do

  factory :user do
    name "carygrant"
    sequence(:email) { |n| "crazyemail#{n}@something.gov" }
    password "woooooooo2"
  end

  factory :sample do
    user
    specimen { Rack::Test::UploadedFile.new(File.open(Rails.root.join('spec', 'testfile', 'sadtrombone.mp3')), 'audio/mp3') }
    sequence(:name) {|n| "#{n}SampleSoGood"}
    sequence(:length) {|n| n }
    sequence(:category) {|n| "#{n}nicegenre"}
    sequence(:description){|n| "#{n}So good!!"}
  end

  factory :song do
    user
    sequence(:name){ |n| "Excellent Song#{n}"}
    category "Dope"
  end

  factory :comment do
    user
    sample
    body "This is a darn great sample."
  end
end
