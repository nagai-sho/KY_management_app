class QualityRiskPrediction < ApplicationRecord
  belongs_to :site

  validates :content, presence: true
end