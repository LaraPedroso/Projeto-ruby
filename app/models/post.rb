class Post < ApplicationRecord
  belongs_to :admin
  has_one_attached :image
  has_many :post_cats, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :summary
  validates_presence_of :content

  validates_length_of :name, maximum: 15, message: 'deve ter pelo menos 15 caracteres'
  validates_length_of :summary, maximum: 50, message: 'deve ter pelo menos 50 caracteres'
  validates_length_of :content, maximum: 3000, message: 'deve ter pelo menos 255 caracteres'

  validate :image_type


  private

  def image_type
    if image.attached? == false
      errors.add(:image, "is missing!")
    end
    if image.attached? == true
      if image.blob.byte_size > 3000000
        errors.add(:image, 'is too big bro')
      end
      if !image.content_type.in?(%('image/jpeg image/png'))
        errors.add(:image, "needs to be a jpeg or png!")
      end
    end
  end
end
