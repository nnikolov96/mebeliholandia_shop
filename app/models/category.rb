class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :products, dependent: :destroy

  def to_s
    name
  end
end
