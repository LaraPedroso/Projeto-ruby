class Category < ApplicationRecord
    has_many :post_cats

    validates_presence_of :name
    validates_presence_of :description
    validates_length_of :name, maximum: 15, message: 'deve ter pelo menos 15 caracteres'
    validates_length_of :description, maximum: 255, message: 'deve ter pelo menos 255 caracteres'

end
