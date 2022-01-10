function generateColor() {
    let r = parseInt(Math.random() * 255);
    let g = parseInt(Math.random() * 255);
    let b = parseInt(Math.random() * 255);
    return `rgb(${r}, ${g}, ${b})`
}

function lineChart(id, lineLabels=[], lineInfo=[]) {
    let colors = []
    for (let i = 0; i < lineInfo.length; i++)
        colors.push(generateColor())

    const data = {
        labels: lineLabels,
        datasets: [{
            label: 'Thống kê theo tuyến xe',
            data: lineInfo,
            backgroundColor: colors,
            hoverOffset: 4
        }]
    };

    const config = {
        type: 'doughnut',
        data: data,
    };

    let ctx = document.getElementById(id).getContext("2d")

    new Chart(ctx, config)
}

function tripChart(id, tripLabels=[], tripInfo=[]) {
    let colors = []
    for (let i = 0; i < tripInfo.length; i++)
        colors.push(generateColor())

    const data = {
        labels: tripLabels,
        datasets: [{
            label: 'Thống kê theo chuyến xe',
            data: tripInfo,
            backgroundColor: colors,
            hoverOffset: 4
        }]
    };

    const config = {
        type: 'doughnut',
        data: data,
    };

    let ctx = document.getElementById(id).getContext("2d")

    new Chart(ctx, config)
}

function monthChart(id, monthLabels=[], monthInfo=[]) {
    let colors = []
    for (let i = 0; i < monthInfo.length; i++)
        colors.push(generateColor())

    const data = {
        labels: monthLabels,
        datasets: [{
            label: 'Thống kê theo chuyến xe',
            data: monthInfo,
            backgroundColor: colors,
            hoverOffset: 4
        }]
    };

    const config = {
        type: 'doughnut',
        data: data,
    };

    let ctx = document.getElementById(id).getContext("2d")

    new Chart(ctx, config)
}