class Post < ApplicationRecord
  belongs_to :admin
  has_one_attached :image
  has_many :post_cats, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :summary
  validates_presence_of :content

  validates_length_of :name, maximum: 15, message: 'deve ter pelo menos 15 caracteres'
  validates_length_of :summary, maximum: 50, message: 'deve ter pelo menos 50 caracteres'
  validates_length_of :content, maximum: 255, message: 'deve ter pelo menos 255 caracteres'

end
