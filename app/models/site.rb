class Site < ApplicationRecord
  has_many :users, through: :user_sites
  has_many :user_sites
  has_many :site_risk_predictions, dependent: :destroy
  has_many :site_risk_measures, dependent: :destroy
  has_many :safety_risk_predictions, dependent: :destroy
  has_many :safety_risk_measures, dependent: :destroy
  has_many :quality_risk_predictions, dependent: :destroy
  has_many :quality_risk_measures, dependent: :destroy
  has_many :actions, dependent: :destroy
  has_many :locations, dependent: :destroy
  has_many :projects, dependent: :destroy

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
