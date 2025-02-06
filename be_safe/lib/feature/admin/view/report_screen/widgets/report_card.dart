import 'package:flutter/material.dart';

import '../../../../../constant/color_string.dart';
import '../../../../../model/report_model.dart';

class ReportCard extends StatefulWidget {
  final ReportModel report;
  final VoidCallback onResolve;

  const ReportCard({
    super.key,
    required this.report,
    required this.onResolve,
  });

  @override
  _ReportCardState createState() => _ReportCardState();
}

class _ReportCardState extends State<ReportCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Card(
      elevation: 4,
      color: isDarkMode?colorScheme.surface:AppColors.bgGray,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ListTile(
            title: Text(widget.report.title),
            subtitle: Text(widget.report.date),
            trailing: Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
          ),
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.report.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Status: ${widget.report.status}',
                        style: TextStyle(
                          color: widget.report.status == 'Pending' ? Colors.orange : Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (widget.report.status == 'Pending')
                        ElevatedButton(
                          onPressed: widget.onResolve,
                          child: const Text('Resolve'),
                        ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
