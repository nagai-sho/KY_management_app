class CreateQualityRiskMeasures < ActiveRecord::Migration[7.0]
  def change
    create_table :quality_risk_measures do |t|
      t.text :content, null: false
      t.timestamps

      t.references :site, null: false, foreign_key: true
    end
  end
end
