class Sample < ActiveRecord::Base
  belongs_to :user
  has_many :song_samples

  validates :specimen, presence: {message: "You didn't include a file."}

  mount_uploader :specimen, SpecimenUploader
end
