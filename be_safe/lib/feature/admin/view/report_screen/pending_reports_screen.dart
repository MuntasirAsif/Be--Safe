import 'package:be_safe/feature/admin/view/report_screen/widgets/report_card.dart';
import 'package:flutter/material.dart';
import '../../../../model/report_model.dart';


class PendingReportsScreen extends StatelessWidget {
  const PendingReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ReportModel> pendingReports = List.generate(
      10,
          (index) => ReportModel(
        title: 'Pending Report #$index',
        description: 'This is a description of pending report #$index.',
        date: '2024-09-20',
        status: 'Pending',
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pending Reports'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: pendingReports.length,
        itemBuilder: (context, index) {
          return ReportCard(
            report: pendingReports[index],
            onResolve: () {
              // Handle the logic when a report is resolved
              // E.g., mark the report as resolved
            },
          );
        },
      ),
    );
  }
}
