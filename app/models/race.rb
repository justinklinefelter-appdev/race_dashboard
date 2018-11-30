class Race < ApplicationRecord
  # Direct associations

  has_many   :results,
             :dependent => :destroy

  belongs_to :event

  # Indirect associations

  # Validations

end
