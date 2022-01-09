class Project < ApplicationRecord
  KNOWN_FORMATS = %w[plain markdown].freeze
  validates :title, :description, presence: true, uniqueness: true
  validates :title, length: {maximum: 150}
  validates :format, length: {minimum: 2, maximum: 8}
  validates :format, inclusion: {in:KNOWN_FORMATS, message:"%{value} is not included in #{KNOWN_FORMATS}"}, presence: true
  validate :title_first_five_letters

  validates_with DescriptionValidator

  def title_first_five_letters
    if title.present? && title.first(5) =~ /\d{5}/
      errors.add(:title, 'First 5 letters cant be numbers')
    end
  end
  has_one :first_task, class_name: 'Task', foreign_key:'project_id'
  has_many :tasks

end