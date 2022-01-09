class Task < ApplicationRecord
  belongs_to :project, class_name: 'Project', foreign_key: 'project_id'
  has_and_belongs_to_many :tasks, join_table: 'customer_tasks'

end
