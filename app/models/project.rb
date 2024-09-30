class Project < ApplicationRecord
  belongs_to :site
  has_many :ky_sheets, dependent: :destroy

  validates :name, presence: true
end
