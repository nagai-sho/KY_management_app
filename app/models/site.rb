class Site < ApplicationRecord
  has_many :users, through: :users_sites
  has_many :users_sites, dependent: :destroy
  has_many :site_risk_predictions
  has_many :site_risk_measures
  has_many :projects

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
