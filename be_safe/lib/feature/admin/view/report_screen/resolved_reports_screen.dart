import 'package:be_safe/feature/admin/view/report_screen/widgets/report_card.dart';
import 'package:flutter/material.dart';

import '../../../../model/report_model.dart';

class ResolvedReportsScreen extends StatelessWidget {
  const ResolvedReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ReportModel> resolvedReports = List.generate(
      10,
          (index) => ReportModel(
        title: 'Resolved Report #$index',
        description: 'This is a description of resolved report #$index.',
        date: '2024-08-10',
        status: 'Resolved',
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resolved Reports'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: resolvedReports.length,
        itemBuilder: (context, index) {
          return ReportCard(
            report: resolvedReports[index],
            onResolve: () {
              // Resolved reports won't have this action
            },
          );
        },
      ),
    );
  }
}
