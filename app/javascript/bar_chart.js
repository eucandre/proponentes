// app/javascript/bar_chart.js

import Chart from 'chart.js/auto';

document.addEventListener('turbolinks:load', () => {
  const canvas = document.getElementById('barChart');
  if (canvas) {
    const ctx = canvas.getContext('2d');

    // Faça uma solicitação AJAX para obter os dados do gráfico
    fetch('/charts/bar_chart_data')
      .then((response) => response.json())
      .then((data) => {
        new Chart(ctx, {
          type: 'bar',
          data: {
            labels: ['Label 1', 'Label 2', 'Label 3', 'Label 4', 'Label 5', 'Label 6'],
            datasets: [{
              label: 'Valores',
              data: data,
              backgroundColor: 'rgba(75, 192, 192, 0.2)',
              borderColor: 'rgba(75, 192, 192, 1)',
              borderWidth: 1,
            }],
          },
          options: {
            responsive: true,
          },
        });
      });
  }
});
