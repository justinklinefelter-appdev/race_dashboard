class Result < ApplicationRecord
  # Direct associations

  has_many   :comments,
             :dependent => :destroy

  belongs_to :race

  belongs_to :user

  # Indirect associations

  # Validations

end
