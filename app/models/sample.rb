class Sample < ActiveRecord::Base
  belongs_to :user
  has_many :songsamples
end
