FactoryGirl.define do

  factory :user do
    name "carygrant"
    sequence :email do |n|
      "#{n}crazyemail@something.gov"
    end
    password "woooooooo2"
  end

  factory :sample do
    user
    sequence :filename do |n|
      "http://www.google.com/##{n}"
    end
    sequence :name do |n|
      "#{n}SampleSoGood"
    end
    sequence :length do |n|
      n
    end
    sequence :category do |n|
      "#{n}nicegenre"
    end
    sequence :desc do |n|
      "#{n}So good!!"
    end
  end
end
