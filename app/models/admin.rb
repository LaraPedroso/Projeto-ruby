class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
devise  :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
    has_many :posts, dependent: :destroy
    belongs_to :role
    has_one :ability
    has_many :comments, dependent: :destroy


    def adminn?
      role_id == 1

    end
    def comentarista?
      role_id == 2
    end
end
