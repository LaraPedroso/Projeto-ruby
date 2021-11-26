class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
devise  :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
    has_many :posts
    belongs_to :role


  def valid?
    role_id == 1
  end
end
