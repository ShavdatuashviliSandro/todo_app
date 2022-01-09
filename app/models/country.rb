class Country < ApplicationRecord
  has_many :cities
  accepts_nested_attributes_for :cities, allow_destroy: true
end
