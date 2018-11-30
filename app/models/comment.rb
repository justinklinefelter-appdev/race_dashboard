class Comment < ApplicationRecord
  # Direct associations

  belongs_to :commentor,
             :class_name => "User"

  # Indirect associations

  # Validations

end
