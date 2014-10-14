class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :user, presence: true

  def get_news
    news = Topic.where(type: 'news')
  end

end
