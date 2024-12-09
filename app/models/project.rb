class Project < ApplicationRecord
  belongs_to :site
  has_many :ky_sheets, dependent: :destroy

  validates :name, presence: true

  def self.search(keyword)
    where('name LIKE :keyword OR client LIKE :keyword 
    OR construction_content LIKE :keyword', keyword: "%#{keyword}%")
  end
end
