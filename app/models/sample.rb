class Sample < ActiveRecord::Base
  belongs_to :user
  has_many :song_samples
  has_many :songs, through: :song_samples
  has_many :comments

  validates :specimen, presence: {message: "You didn't include a file."}
  validates :category, presence: true
  validates :name, presence: true, uniqueness: true
  validates :user_id, presence: true, uniqueness: true

  mount_uploader :specimen, SpecimenUploader
end
