
library charted.demo.charts.combo_charts;

import "dart:html";
import "package:charted/charts/charts.dart";
import "../demo_charts.dart";

void drawBarLineCombo(String selector, bool grouped, Iterable<Iterable> rawData) {
  // compute net = income - expenses
  for (List array in rawData) {
    array[1] = array[3] - array[2];
  }
  var wrapper = document.querySelector(selector),
      areaHost = wrapper.querySelector(selector + ' .chart-host'),
      legendHost = wrapper.querySelector(selector + ' .chart-legend-host');

  var series1 = new ChartSeries("one", grouped ? [2, 3] : [2], new BarChartRenderer());
  var series2 = new ChartSeries("two", [1], new LineChartRenderer());

  // [0] = ORDINAL_DATA[0] = Month
  var config = new ChartConfig([series1, series2], [0])
        ..legend = new ChartLegend(legendHost);

  var data = new ChartData(ORDINAL_DATA_COLUMNS, rawData);
  //  var state = new ChartState();

  var area = new CartesianArea(areaHost, data, config, state: new ChartState());

  createDefaultCartesianBehaviors().forEach((behavior) {
    area.addChartBehavior(behavior);
  });
  area.draw();
}

// void drawStackedBarLineCombo(String selector) {
//   var wrapper = document.querySelector(selector),
//       areaHost = wrapper.querySelector('.chart-host'),
//       legendHost = wrapper.querySelector('.chart-legend-host');
//
//   var series1 = new ChartSeries(
//           "one", [2, 3], new StackedBarChartRenderer()),
//       series2 = new ChartSeries("two", [1], new LineChartRenderer()),
//       config = new ChartConfig([series1, series2], [0])
//         ..legend = new ChartLegend(legendHost),
//       data = new ChartData(
//           ORDINAL_DATA_COLUMNS, ORDINAL_DATA),
//       state = new ChartState();
//
//   var area = new CartesianArea(areaHost, data, config, state: state);
//
//   createDefaultCartesianBehaviors().forEach((behavior) {
//     area.addChartBehavior(behavior);
//   });
//   area.draw();
// }

main() {
  bool grouped = true;
//  drawBarLineCombo('#bar-line-combo-chart', false);
  drawBarLineCombo('#grouped-weekly', grouped, ORDINAL_DATA_WEEKLY);
  drawBarLineCombo('#grouped-monthly', grouped, ORDINAL_DATA);
//  drawStackedBarLineCombo('#stacked-bar-line-combo-chart');
}
