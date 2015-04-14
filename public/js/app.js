
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

function FunnelChart(array_data, divx){
        $('#'+divx).highcharts({
        chart: {
            type: 'funnel',
            marginRight: 100
        },
        title: {
            text: 'Funnel de Ventas',
            x: -50
        },
        plotOptions: {
            series: {
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b> ({point.y:,.0f})',
                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || '#000',
                    softConnector: true
                },
                neckWidth: '30%',
                neckHeight: '25%'
            }
        },
        legend: {
            enabled: false
        },
        series: [{
            name: 'Ventas',
            data: array_data
        }]
    });
}


function ClockOk(divx){

    /**
     * Get the current time
     */
    function getNow() {
        var now = new Date();

        return {
            hours: now.getHours() + now.getMinutes() / 60,
            minutes: now.getMinutes() * 12 / 60 + now.getSeconds() * 12 / 3600,
            seconds: now.getSeconds() * 12 / 60
        };
    }

    /**
     * Pad numbers
     */
    function pad(number, length) {
        // Create an array of the remaining length + 1 and join it with 0's
        return new Array((length || 2) + 1 - String(number).length).join(0) + number;
    }

    var now = getNow();

    // Create the chart
    $('#'+divx).highcharts({

        chart: {
            type: 'gauge',
            plotBackgroundColor: '#eee',
            plotBackgroundImage: null,
            plotBorderWidth: 0,
            plotShadow: true,
            height: 400
        },

        credits: {
            enabled: false
        },

        title: {
            text: 'Relog de Cúrsame'
        },

        pane: {
            background: [{
                // default background
            }, {
                // reflex for supported browsers
                backgroundColor: Highcharts.svg ? {
                    radialGradient: {
                        cx: 0.5,
                        cy: -0.4,
                        r: 1.9
                    },
                    stops: [
                        [0.5, 'rgba(255, 255, 255, 0.2)'],
                        [0.5, 'rgba(200, 200, 200, 0.2)']
                    ]
                } : null
            }]
        },

        yAxis: {
            labels: {
                distance: -20
            },
            min: 0,
            max: 12,
            lineWidth: 0,
            showFirstLabel: false,

            minorTickInterval: 'auto',
            minorTickWidth: 1,
            minorTickLength: 5,
            minorTickPosition: 'inside',
            minorGridLineWidth: 0,
            minorTickColor: '#666',

            tickInterval: 1,
            tickWidth: 2,
            tickPosition: 'inside',
            tickLength: 10,
            tickColor: '#666',
            title: {
                text: 'Powered by<br/>Highcharts',
                style: {
                    color: '#BBB',
                    fontWeight: 'normal',
                    fontSize: '8px',
                    lineHeight: '10px'
                },
                y: 10
            }
        },

        tooltip: {
            formatter: function () {
                return this.series.chart.tooltipText;
            }
        },

        series: [{
            data: [{
                id: 'hour',
                y: now.hours,
                dial: {
                    radius: '60%',
                    baseWidth: 4,
                    baseLength: '95%',
                    rearLength: 0
                }
            }, {
                id: 'minute',
                y: now.minutes,
                dial: {
                    baseLength: '95%',
                    rearLength: 0
                }
            }, {
                id: 'second',
                y: now.seconds,
                dial: {
                    radius: '100%',
                    baseWidth: 1,
                    rearLength: '20%'
                }
            }],
            animation: false,
            dataLabels: {
                enabled: false
            }
        }]
    },

        // Move
        function (chart) {
            setInterval(function () {

                now = getNow();

                var hour = chart.get('hour'),
                    minute = chart.get('minute'),
                    second = chart.get('second'),
                    // run animation unless we're wrapping around from 59 to 0
                    animation = now.seconds === 0 ?
                            false :
                            {
                                easing: 'easeOutElastic'
                            };

                // Cache the tooltip text
                chart.tooltipText =
                    pad(Math.floor(now.hours), 2) + ':' +
                    pad(Math.floor(now.minutes * 5), 2) + ':' +
                    pad(now.seconds * 5, 2);

                hour.update(now.hours, true, animation);
                minute.update(now.minutes, true, animation);
                second.update(now.seconds, true, animation);

            }, 1000);

        });

// Extend jQuery with some easing (copied from jQuery UI)
$.extend($.easing, {
    easeOutElastic: function (x, t, b, c, d) {
        var s=1.70158;var p=0;var a=c;
        if (t==0) return b;  if ((t/=d)==1) return b+c;  if (!p) p=d*.3;
        if (a < Math.abs(c)) { a=c; var s=p/4; }
        else var s = p/(2*Math.PI) * Math.asin (c/a);
        return a*Math.pow(2,-10*t) * Math.sin( (t*d-s)*(2*Math.PI)/p ) + c + b;
    }
});
}