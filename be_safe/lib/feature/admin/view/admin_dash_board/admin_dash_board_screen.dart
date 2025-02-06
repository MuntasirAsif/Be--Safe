
import 'package:be_safe/feature/admin/view/admin_dash_board/stat_section.dart';
import 'package:be_safe/feature/admin/view/admin_dash_board/widgets/custom_app_bar.dart';
import 'package:be_safe/feature/admin/view/admin_dash_board/widgets/custom_drawer.dart';
import 'package:be_safe/feature/admin/view/admin_dash_board/widgets/overview_grid.dart';
import 'package:flutter/material.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OverviewGrid(),
              SizedBox(height: 20),
              StatSection(),
            ],
          ),
        ),
      ),
    );
  }
}
