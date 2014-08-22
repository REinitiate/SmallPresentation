/**
 * pattern.jsp 에서 캔들차트 생성과 관련된 기능을 담당.
 */
    function DrawChart3(div, jsonData) {
        
    	itemabbrnm = jsonData.gicode;
    	
    	data = jsonData.timeseries;
        console.log(data);

            // split the data set into ohlc and volume
            var ohlc = [],
                volume = [],
                dataLength = data.length,
                // set the allowed units for data grouping
                groupingUnits = [[
                    'week',                         // unit name
                    [1]                             // allowed multiples
                ], [
                    'month',
                    [1, 2, 3, 4, 6]
                ]],

                i = 0;

            for (i; i < data.length; i += 1) {
                ohlc.push([
                    data[i][0], // the date
                    data[i][1], // open
                    data[i][2], // high
                    data[i][3], // low
                    data[i][4] // close
                ]);

//                volume.push([
//                    data[i][0], // the date
//                    data[i][5] // the volume
//                ]);
            }
            
            console.log(ohlc);


            // create the chart
            div.highcharts('StockChart', {
            	exporting: { enabled: false },
                rangeSelector: {
                    inputEnabled: $('#div_chart').width() > 600,
                    selected: 1,
                    enabled: false
                },
                credits: {
                    enabled: false
                },
                plotOptions: {
                	 candlestick: {
                	            color: 'rgb(127, 141, 169)',
                	            upColor: 'rgb(219, 76, 60)',
                	            point:{
                	            	events:{
                	            		click:'function(){alert("gg")}'
                	            	}
                	            }
                	        }
                	    },
                title: {
                    text: ''
                },

                yAxis: [{
                    labels: {
                        align: 'right',
                        x: -3
                    },
                    title: {
                        text: ''
                    },
                    height: '100%',
                    lineWidth: 2
                }],
                
                xAxis: {
                    min: Date.UTC(2006, 7, 1),
	                type: 'datetime',	                
	                dateTimeLabelFormats: {
	                    second: '%Y-%m-%d<br/>%H:%M:%S',
	                    minute: '%Y-%m-%d<br/>%H:%M',
	                    hour: '%Y-%m-%d<br/>%H:%M',
	                    day: '%Y/%m/%d',
	                    week: '%Y<br/>%m-%d',
	                    month: '%Y-%m',
	                    year: '%Y'
	                }
                },

                series: [{
                    type: 'candlestick',
                    name: 'AAPL',
                    data: ohlc,
                    dataGrouping: {
                        units: groupingUnits
                    }
                }],
                
                navigator: {
                    xAxis: {
                    	type: 'datetime',	                
    	                dateTimeLabelFormats: {
    	                    second: '%Y-%m-%d<br/>%H:%M:%S',
    	                    minute: '%Y-%m-%d<br/>%H:%M',
    	                    hour: '%Y-%m-%d<br/>%H:%M',
    	                    day: '%Y-%m-%d',
    	                    week: '%Y/%m/%d',
    	                    month: '%Y-%m',
    	                    year: '%Y'
    	                }
                    }
                },
            });        
    };