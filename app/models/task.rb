class Task < ApplicationRecord
  belongs_to :category
  belongs_to :owner, class_name: 'User'
  has_many :participating_user, class_name: 'Participant'
  has_many :participants, through: :participating_user, source: :user

  validates :name, :description, presence: true
  validate :due_data_validity


  def due_data_validity
    return if due_data.blank?
    return if due_data > Date.today
    errors.add :due_data, 'Data error'
  end

end
