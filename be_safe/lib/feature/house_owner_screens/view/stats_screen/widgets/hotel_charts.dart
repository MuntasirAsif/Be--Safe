import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../../../model/hotel_model.dart'; // Import the fl_chart package

class HotelCharts extends StatelessWidget {
  final HotelModel hotelModel;

  const HotelCharts({Key? key, required this.hotelModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Room Occupancy',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      color: Colors.green,
                      value: hotelModel.bookedRooms.toDouble(),
                      title: 'Booked\n${hotelModel.bookedRooms}',
                      radius: 50,
                      titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    PieChartSectionData(
                      color: Colors.blue,
                      value: (hotelModel.totalRooms - hotelModel.bookedRooms).toDouble(),
                      title: 'Available\n${hotelModel.totalRooms - hotelModel.bookedRooms}',
                      radius: 50,
                      titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                  borderData: FlBorderData(show: false),
                  sectionsSpace: 0,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
