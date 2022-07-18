class Blog < ApplicationRecord
  belongs_to :user
  has_one :like
end
