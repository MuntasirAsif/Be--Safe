import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MonthlyIncomeChart extends StatelessWidget {
  final List<double> monthlyIncome;

  const MonthlyIncomeChart({super.key, required this.monthlyIncome});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Last 3 Months Income',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 250,
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: false),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          const style = TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          );
                          String text;
                          switch (value.toInt()) {
                            case 0:
                              text = 'Month 1';
                              break;
                            case 1:
                              text = 'Month 2';
                              break;
                            case 2:
                              text = 'Month 3';
                              break;
                            default:
                              text = '';
                              break;
                          }
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(text, style: style),
                          );
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (value, meta) {
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(
                              value.toString(),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(
                      color: const Color(0xff37434d),
                      width: 1,
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: List.generate(
                        monthlyIncome.length,
                            (index) => FlSpot(index.toDouble(), monthlyIncome[index]),
                      ),
                      isCurved: true,
                      color: Colors.blue,
                      dotData: const FlDotData(show: true),
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // List of monthly incomes
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(monthlyIncome.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    'Month ${index + 1}: BDT ${monthlyIncome[index].toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
