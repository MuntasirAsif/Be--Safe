
import 'package:flutter/material.dart';
import '../../balance/balance_screen.dart';
import '../../house_owner/house_owner_request.dart';
import '../../house_owner/house_owner_screen.dart';
import '../../manage_user/manage_user_screen.dart';
import '../../payment_screen/paid_payments_screen.dart';
import '../../payment_screen/pending_payments_screen.dart';
import '../../report_screen/pending_reports_screen.dart';
import '../../report_screen/resolved_reports_screen.dart';
import 'overview_card.dart';

class OverviewGrid extends StatelessWidget {
  const OverviewGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 5,
        childAspectRatio: .85,
      ),
      children: [
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ManageUserScreen()));
          },
          child: const OverviewCard(
            icon: Icons.people_outline,
            label: 'Total Users',
            value: 11230,
          ),
        ),
        InkWell(
          onTap:(){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const BalanceScreen()));
          },
          child: const OverviewCard(
            icon: Icons.monetization_on_outlined,
            label: 'Balance',
            value: 26045,
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HouseOwnerScreen()));
          },
          child: const OverviewCard(
            icon: Icons.house_outlined,
            label: 'Total House Owner',
            value: 155,
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HouseOwnerRequestScreen()));
          },
          child: const OverviewCard(
            icon: Icons.group_add_outlined,
            label: 'House Owner Request',
            value: 12,
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const PendingPaymentsScreen()));
          },
          child: const OverviewCard(
            icon: Icons.sell_outlined,
            label: 'Pending Hotel Payments',
            value: 6,
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const PaidPaymentsScreen()));
          },
          child: const OverviewCard(
            icon: Icons.sell_outlined,
            label: 'Payed Hotel Payments',
            value: 8,
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const PaidPaymentsScreen()));
          },
          child: const OverviewCard(
            icon: Icons.message_outlined,
            label: 'All Chats',
            value: 82,
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const PendingReportsScreen()));
          },
          child: const OverviewCard(
            icon: Icons.report_gmailerrorred,
            label: 'Pending Reports',
            value: 45,
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const ResolvedReportsScreen()));
          },
          child: const OverviewCard(
            icon: Icons.check_circle_outline,
            label: 'Resolved Reports',
            value: 342,
          ),
        ),
      ],
    );
  }
}
