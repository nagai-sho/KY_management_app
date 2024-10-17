class KySheet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :project

  belongs_to_active_hash :risk_level,        optional: true
  belongs_to_active_hash :incidence_rate,    optional: true
  belongs_to_active_hash :construction_type, optional: true 
  
  belongs_to :site_risk_prediction,          optional: true
  belongs_to :site_risk_measure,             optional: true
  belongs_to :safety_risk_prediction,        optional: true
  belongs_to :safety_risk_measure,           optional: true
  belongs_to :quality_risk_prediction,       optional: true
  belongs_to :quality_risk_measure,          optional: true
  belongs_to :location,                      optional: true
  belongs_to :construction_content,          optional: true

  has_one_attached :pdf_file


  with_options presence: true do

  end
  # validates :risk_level_id, :incidence_rate_id, :construction_type_id,
  #           numericality: { other_than: 0, message: "未選択項目を選択してください" }

  # 一時的なデータ処理のための属性
  attr_accessor :construction_type_id,
                :construction_completion,
                :location_id_1,
                :location_id_2,
                :location_id_3,
                :location_id_4,
                :location_id_5,
                :construction_content_id_1,
                :construction_content_id_2,
                :construction_content_id_3,
                :construction_content_id_4,
                :safety_risk_prediction_id_1,
                :safety_risk_prediction_id_2,
                :safety_risk_measure_id_1,
                :safety_risk_measure_id_2,
                :quality_risk_prediction_id,
                :quality_risk_measure_id,
                :site_risk_prediction_id,
                :site_risk_measure_id,
                :priority_content,
                :priority_measure_risk,
                :priority_measure,
                :risk_level_id_1,
                :risk_level_id_2,
                :risk_level_id_3,
                :risk_level_id_4,
                :risk_level_id_5,
                :incidence_rate_id_1,
                :incidence_rate_id_2,
                :incidence_rate_id_3,
                :incidence_rate_id_4,
                :incidence_rate_id_5,
                :answer_1,
                :answer_2,
                :answer_3,
                :answer_4,
                :answer_5,
                :answer_6,
                :signature_sig1,
                :signature_sig2,
                :signature_sig3,
                :signature_sig4,
                :signature_sig5,
                :signature_sig6,
                :signature_sig7,
                :signature_sig8,
                :signature_sig9,
                :signature_sig10,
                :signature_sig11,
                :worker,
                :manager
end
