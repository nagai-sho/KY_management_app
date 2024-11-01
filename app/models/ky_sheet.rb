class KySheet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :project
  
  # ky_sheetsテーブルにカラムが無いため、 optional: true が必要
  belongs_to_active_hash :risk_level, optional: true
  belongs_to_active_hash :incidence_rate, optional: true
  belongs_to_active_hash :construction_type, optional: true
  # ky_sheetsテーブルにカラムが無いため、 optional: true が必要
  
  has_one_attached :pdf_file

  # 一時的なデータ処理のための属性
  attr_accessor :construction_type_id,
                :construction_date,
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
                :assessment_result1,
                :assessment_result2,
                :assessment_result3,
                :assessment_result4,
                :assessment_result5,
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

  with_options presence: true do
    validates :construction_type_id
    validates :construction_date
    validates :location_id_1
    validates :location_id_2
    validates :location_id_3
    validates :location_id_4
    validates :location_id_5
    validates :construction_content_id_1
    validates :construction_content_id_2
    validates :construction_content_id_3
    validates :construction_content_id_4
    validates :safety_risk_prediction_id_1
    validates :safety_risk_prediction_id_2
    validates :safety_risk_measure_id_1
    validates :safety_risk_measure_id_2
    validates :quality_risk_prediction_id
    validates :quality_risk_measure_id
    validates :site_risk_prediction_id
    validates :site_risk_measure_id
    validates :priority_content
    validates :priority_measure_risk
    validates :priority_measure
    validates :risk_level_id_1
    validates :risk_level_id_2
    validates :risk_level_id_3
    validates :risk_level_id_4
    validates :risk_level_id_5
    validates :incidence_rate_id_1
    validates :incidence_rate_id_2
    validates :incidence_rate_id_3
    validates :incidence_rate_id_4
    validates :incidence_rate_id_5
    validates :assessment_result1
    validates :assessment_result2
    validates :assessment_result3
    validates :assessment_result4
    validates :assessment_result5
    validates :answer_1
    validates :answer_2
    validates :answer_3
    validates :answer_4
    validates :answer_5
    validates :answer_6
    validates :signature_sig1
    validates :signature_sig2
    validates :signature_sig3
    validates :signature_sig4
    validates :signature_sig5
    validates :signature_sig6
    validates :signature_sig7
    validates :signature_sig8
    validates :signature_sig9
    validates :signature_sig10
    validates :signature_sig11
    validates :worker
    validates :manager
  end

  # validates :risk_level_id, :incidence_rate_id, :construction_type_id,
  #           numericality: { other_than: 0, message: "未選択項目を選択してください" }

end


