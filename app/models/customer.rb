class Customer < ApplicationRecord
  has_many :customer_tasks
  has_many :tasks, through: :customer_tasks
end
