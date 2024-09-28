class Project < ApplicationRecord
  belongs_to :site
  has_many :ky_sheets

  validates :name, presence: true
end
