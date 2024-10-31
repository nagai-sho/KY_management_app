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

      riskLevelSelect.addEventListener('change', () => {
        console.log('change!');
        this.updateRiskLevel(
          riskLevelSelect,
          incidenceRateSelect,
          riskAssessment
        );
      });

      incidenceRateSelect.addEventListener('change', () => {
        console.log('change!');
        this.updateRiskLevel(
          riskLevelSelect,
          incidenceRateSelect,
          riskAssessment
        );
      });

      this.updateRiskLevel(
        riskLevelSelect,
        incidenceRateSelect,
        riskAssessment
      );
    });
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
}
