class KySheet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :project
  has_many :risk_levels
  has_many :indidence_rates
  has_many :construction_types

  validates :risk_levels, :indidence_rates, :construction_types,
            numericality: { other_than: 0, message: "未選択項目を選択してください" }
end
