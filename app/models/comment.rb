class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :admin
  has_many :comments, dependent: :delete_all

  validates_presence_of :content
end
