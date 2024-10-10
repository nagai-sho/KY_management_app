console.log('Hello! Assessment.');

// window.addEventListener('load', function () {
//   const assessments = document.querySelectorAll('.assessment');

//   assessments.forEach((assessment) => {
//     const riskLevelSelect = assessment.querySelector('.risk_level-select');
//     const incidenceRateSelect = assessment.querySelector(
//       '.incidence_rate-select'
//     );
//     const resultSpan = assessment;

//     if (!riskLevelSelect || !incidenceRateSelect || !resultSpan) {
//       console.error('必要な要素が見つかりませんでした。');
//       return;
//     }

//     function updateRiskAssessment() {
//       const riskLevelId = parseInt(riskLevelSelect.value);
//       const incidenceRateId = parseInt(incidenceRateSelect.value);

//       const result = riskLevelId + incidenceRateId;

//       let assessmentText = '低：要注意';
//       if (result >= 3) {
//         assessmentText = '中：要対策';
//       }
//       if (result >= 5) {
//         assessmentText = '高：再検討';
//       }
//       resultSpan.textContent = assessmentText;
//     }

//     riskLevelSelect.addEventListener('change', updateRiskAssessment);
//     incidenceRateSelect.addEventListener('change', updateRiskAssessment);
//   });
// });
