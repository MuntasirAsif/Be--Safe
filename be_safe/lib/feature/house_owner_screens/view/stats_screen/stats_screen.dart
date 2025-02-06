import 'package:be_safe/feature/house_owner_screens/view/stats_screen/widgets/discount_offer.dart';
import 'package:be_safe/feature/house_owner_screens/view/stats_screen/widgets/hotel_charts.dart';
import 'package:be_safe/feature/house_owner_screens/view/stats_screen/widgets/hotel_summary.dart';
import 'package:be_safe/feature/house_owner_screens/view/stats_screen/widgets/monthly_income_chart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../model/hotel_model.dart';
import '../../../User/repository/hotel_repository.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  late HotelModel hotelModel;
  bool isLoading = true; // To track loading state
  final String hotelId = FirebaseAuth.instance.currentUser!.uid; // Replace with the actual hotelId
  final HotelRepository hotelRepository = HotelRepository();

  @override
  void initState() {
    super.initState();
    fetchHotelData();
  }

  Future<void> fetchHotelData() async {
    try {
      final hotel = await hotelRepository.getHotelById(hotelId);
      setState(() {
        hotelModel = hotel!;
        isLoading = false;// Data fetched successfully
      });
    } catch (e) {
      setState(() {
        isLoading = false; // Stop loading if there's an error
      });
      // Optionally show an error dialog or message
      print('Error fetching hotel data: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    List<Offer> offerList = [
      Offer(
        title: 'Summer Bonanza',
        description: 'Enjoy a 25% discount on all bookings for stays during summer!',
        discount: 25.0,
      ),
      Offer(
        title: 'VIP Members Exclusive',
        description: 'VIP members get 35% off on all room bookings!',
        discount: 35.0,
      ),
    ];
    return isLoading?const Center(child: CircularProgressIndicator(),):Scaffold(
      appBar: AppBar(
        title: Text(hotelModel.name,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HotelSummary(hotelModel: hotelModel),
            HotelCharts(hotelModel: hotelModel),
            DiscountAndOffersWidget(discountData: const [10,17,13,17,25], offers: offerList),
            const MonthlyIncomeChart(monthlyIncome: [100,532,213])
          ],
        ),
      ),
    );
  }
}
