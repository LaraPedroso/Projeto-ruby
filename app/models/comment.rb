class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :admin

  validates_presence_of :content
end
