	// Bar chart
	new Chart(document.getElementById("bar-chart"), {
		type: 'bar',
		data: {
			labels: ["신입 탐정", "프로 탐정", "유명한 탐정", "명탐정", "국민 탐정"],
			datasets: [
				{
					label: "채택 답변수",
					backgroundColor: ["#DAC4F8", "#DAC4F8",
						"#BB73DF", "#BB73DF", "#8758F5"],
					data: [30, 70, 100, 300, 1000]
				}
			]
		},
		options: {
			legend: { display: false },
			title: {
				display: true,
				text: 'Chart JS Bar Chart Example'
			}
		}
	});