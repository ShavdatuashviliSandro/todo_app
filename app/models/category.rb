class Category < ApplicationRecord
  validates :name, presence: true,uniqueness: { scope: :active }
  validates :description, length: { minimum:0,maximum: 300 }
  validates :name, format: { with: /\A[a-zA-Z]+\z/,
                             message: 'only allows letters' }
end
