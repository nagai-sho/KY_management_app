class Project < ApplicationRecord
  has_many :ky_sheets

  validates :name, presence: true
end
