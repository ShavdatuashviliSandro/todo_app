class Product < ApplicationRecord
  belongs_to :product, polymorphic: true
  ####
  before_create do
    Rails.logger.info('===> before_create')
    self.quantity+=2
  end
  before_save do
    Rails.logger.info('===> before_save')
    self.quantity+=2
  end
  before_update do
    Rails.logger.info('===> before_update')
    self.quantity+=20
  end
  before_commit do
    Rails.logger.info('===> before_commit')
    self.quantity+=10
  end
end
