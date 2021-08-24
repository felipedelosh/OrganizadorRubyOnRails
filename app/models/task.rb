class Task < ApplicationRecord
  belongs_to :category
  belongs_to :owner, class_name: 'User'

  validates :name, :description, presence: true
  validate :due_data_validity


  def due_data_validity
    return if due_data.blank?
    return if due_data > Date.today
    errors.add :due_data, 'Data error'
  end

end
