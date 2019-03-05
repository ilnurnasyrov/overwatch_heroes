module AR
  class Hero < ApplicationRecord
    has_many :abilities
  end
end
