class KySheet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :project
  belongs_to :risk_level
  belongs_to :incidence_rate
  belongs_to :construction_type

  validates :risk_level_id, :incidence_rate_id, :construction_type_id,
            numericality: { other_than: 0, message: "未選択項目を選択してください" }
end
