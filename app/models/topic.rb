class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :name, presence: true
end
