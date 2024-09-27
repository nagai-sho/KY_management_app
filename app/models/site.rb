class Site < ApplicationRecord
  has_many :users, through: :users_sites
  has_many :users_sites, dependent: :destroy
  has_many :site_risk_predictions
  has_many :site_risk_measures
  has_many :projects

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :postal_code, format: {
    with: /\A\d{3}[-]\d{4}\z/,
    message: 'は「123-4567」の形式で入力してください'
  },allow_blank: true

  before_validation :normalize_postal_code

  private
  def normalize_postal_code
    if postal_code.present?
      self.postal_code = postal_code.strip.gsub(/\A(\d{3})(\d{4})\z/, '\1-\2')
    end
  end
end
