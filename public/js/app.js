

function TimeChart(catcot , data_stract, divx){
    $('#'+ divx).highcharts({
        chart: {
            type: 'areaspline'
        },
        title: {
            text: 'Logins'
        },
        legend: {
            layout: 'horizontal',
            align: 'right',
            verticalAlign: 'top',
            x: 150,
            y: 150,
            floating: true,
            borderWidth: 2,
            backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
        },
        xAxis: {
            categories: catcot,
            plotBands: [{ // visualize the weekend
                from: 4.5,
                to: 6.5
                //color: 'rgba(68, 170, 213, .2)'
            }]
        },
        yAxis: {
            title: {
                text: 'Personas nuevas que se han logeado '
            }
        },
        tooltip: {
            shared: true,
            valueSuffix: ' ingresos'
        },
        credits: {
            enabled: false
        },
        plotOptions: {
            areaspline: {
                fillOpacity: 0.2
            }
        },
        series: [{
            name: 'Logins',
            data: data_stract
        }]
    });
}