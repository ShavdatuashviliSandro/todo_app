class DescriptionValidator < ActiveModel::Validator
  def validate(record)
    if record.description.include?('todo')
      record.errors.add(:description, 'Cant include todo')
    end
    # if record.password.include?(record.title)
    #   record.errors.add(:password,'your password cant include your name')
    # end
  end
end