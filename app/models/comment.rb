class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :sample
  validates :body, presence: true, length: {maximum: 255}
end
