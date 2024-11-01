import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="assessment"
export default class extends Controller {
  connect() {
    console.log('assessment.js');
    this.initializeRiskAssessment();
  }

  initializeRiskAssessment() {
    const riskForms = document.querySelectorAll('.risk_rate');
    riskForms.forEach((form, index) => {
      const formIndex = index + 1;
      const riskLevelSelect = form.querySelector('.risk_level-select');
      const incidenceRateSelect = form.querySelector('.incidence_rate-select');
      const riskAssessment = form.querySelector('.assessment');
      const hiddenField = form.querySelector(`#assessment_result${formIndex}`);

      const updateAssessment = () => {
        this.updateRiskLevel(
          riskLevelSelect,
          incidenceRateSelect,
          riskAssessment
        );
        this.insertHiddenValue(hiddenField, riskAssessment);
      };

      riskLevelSelect.addEventListener('change', updateAssessment);
      incidenceRateSelect.addEventListener('change', updateAssessment);

      updateAssessment();
    });

    // const form = document.getElementById('save_form');
    // form.addEventListener('submit', (e) => {
    //   this.insertHiddenValue(hiddenField, riskAssessment);
    // });
  }

  updateRiskLevel(riskLevelSelect, incidenceRateSelect, riskAssessment) {
    let riskText;

    if (riskLevelSelect && incidenceRateSelect && riskAssessment) {
      const riskLevel = parseInt(riskLevelSelect.value);
      const incidenceRate = parseInt(incidenceRateSelect.value);

      if (!isNaN(riskLevel) && !isNaN(incidenceRate)) {
        const totalRisk = riskLevel + incidenceRate;

        if (riskLevel === 0 || incidenceRate === 0) {
          riskText = '危険度、発生率を選択してください';
        } else if (totalRisk <= 2) {
          riskText = '低：要注意';
        } else if (totalRisk <= 4) {
          riskText = '中：要対策';
        } else {
          riskText = '高：中止、再検討';
        }
      }
      riskAssessment.textContent = riskText;
    }
  }

  insertHiddenValue(hiddenField, riskAssessment) {
    const assessmentResult = riskAssessment.textContent;
    hiddenField.value = assessmentResult;
    console.log(`Hidden field ${hiddenField.id}: ${hiddenField.value}`);
  }
}
