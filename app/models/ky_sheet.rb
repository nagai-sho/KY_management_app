class KySheet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :project

  belongs_to :risk_level,              optional: true
  belongs_to :incidence_rate,          optional: true
  belongs_to :construction_type,       optional: true
  
  belongs_to :site_risk_prediction,    optional: true
  belongs_to :site_risk_measure,       optional: true
  belongs_to :safety_risk_prediction,  optional: true
  belongs_to :safety_risk_measure,     optional: true
  belongs_to :quality_risk_prediction, optional: true
  belongs_to :quality_risk_measure,    optional: true
  belongs_to :location,                optional: true
  belongs_to :construction_content,    optional: true


  # validates :risk_level_id, :incidence_rate_id, :construction_type_id,
  #           numericality: { other_than: 0, message: "未選択項目を選択してください" }

  # 一時的なデータ処理のための属性
  attr_accessor :construction_completion,
                :site_risk_prediction_id,
                :site_risk_measure_id,
                :safety_risk_prediction_id,
                :safety_risk_measure_id,
                :quality_risk_prediction_id,
                :quality_risk_measure_id,
                :location_id,
                :construction_content_id,
                :answer_1,
                :answer_2,
                :answer_3,
                :answer_4,
                :answer_5,
                :answer_6,
                :sig1,
                :sig2,
                :sig3,
                :sig4,
                :sig5,
                :sig6,
                :sig7,
                :sig8,
                :sig9,
                :sig10,
                :sig11
end
