class Sample < ActiveRecord::Base
  belongs_to :user
  has_many :song_samples

  mount_uploader :specimen, SpecimenUploader
end
