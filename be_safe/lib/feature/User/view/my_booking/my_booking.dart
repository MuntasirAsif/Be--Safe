import 'package:be_safe/feature/User/view/my_booking/widgets/my_booking_card.dart';
import 'package:be_safe/constant/color_string.dart';
import 'package:be_safe/model/hotel_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../constant/text_string.dart';
import '../hotel/hotel_screen.dart';

class MyBooking extends StatelessWidget {
  const MyBooking({super.key});

  @override
  Widget build(BuildContext context) {
    final List<HotelModel> hotels = [
      HotelModel(
        location: 'Barambad',
        name: 'Megh Bari Resort',
        imageUrl:
        ['http://www.oceanparadisehotel.com/storage/sliders/slider_1567496889.png'],
        rating: 5.0,
        reviews: 35,
        price: '3500',
        priceInfo: 'Per Night',
        discount: '15',
        vipStatus: true,
        localBookingOfferPercentage: '1',
        payLater: true,
        hotelCategory: '5',
        hotelId: '1',
        totalRooms: 5,
        bookedRooms: 1,
        isRegistered: true,
        keyFeatures: ['Free Wifi','TV','Free parking'],
        breakfastAvailable: true, description: "Hotel La Vinci offers top-notch services and amenities, ensuring guests experience utmost comfort. Share you photos and respond to emails at your convenience, thanks to the free Wi-Fi internet access offered by hotel.Should you require transportation to or from the airport, hotel is able too organize it prior to your arrival date. Visitors can take advantage of the accessible parking options directly at the hotel.Smoking is limited to specified smoking zones. Begin your holiday on a high note. At Hotel La Vinci, your morning sare greeted with a delightful, free breakfast. Experience thede light of a fresh morning by savoring excellent coffee at the cafe situated within hotel.Should you prefer not to venture out for a meal, the enticing culinary choices at hotel are always available for your satisfaction.Indulge in the numerous pursuits available at Hotel La Vinci. For individuals who don't want to skip their exercise routine, visiting the hotel fitness center ensures you maintain your vitality and wellness.",
      ),
      HotelModel(
        location: "Cox's Bazaar",
        name: 'European Resort',
        imageUrl:
        ['https://cf.bstatic.com/xdata/images/hotel/max1024x768/283183777.jpg?k=899b1542446c88268f790cf9968ddeffe42a7b24c7b228069de09413d5275822&o=&hp=1'],
        rating: 4.5,
        reviews: 20,
        price: '3000',
        priceInfo: 'Per Night',
        discount: '10',
        vipStatus: false,
        localBookingOfferPercentage: '1',
        payLater: false,
        hotelCategory: '3',
        hotelId: '2',
        totalRooms: 5,
        bookedRooms: 1,
        isRegistered: true,
        keyFeatures: ['Free Wifi','TV','Free parking'],
        breakfastAvailable: true, description: "Hotel La Vinci offers top-notch services and amenities, ensuring guests experience utmost comfort. Share you photos and respond to emails at your convenience, thanks to the free Wi-Fi internet access offered by hotel.Should you require transportation to or from the airport, hotel is able too organize it prior to your arrival date. Visitors can take advantage of the accessible parking options directly at the hotel.Smoking is limited to specified smoking zones. Begin your holiday on a high note. At Hotel La Vinci, your morning sare greeted with a delightful, free breakfast. Experience thede light of a fresh morning by savoring excellent coffee at the cafe situated within hotel.Should you prefer not to venture out for a meal, the enticing culinary choices at hotel are always available for your satisfaction.Indulge in the numerous pursuits available at Hotel La Vinci. For individuals who don't want to skip their exercise routine, visiting the hotel fitness center ensures you maintain your vitality and wellness.",
      ),
      HotelModel(
        location: 'Barambad',
        name: 'Megh Bari Resort',
        imageUrl:
        ['http://www.oceanparadisehotel.com/storage/sliders/slider_1567496889.png'],
        rating: 5.0,
        reviews: 35,
        price: '3500',
        priceInfo: 'Per Night',
        discount: '15',
        vipStatus: true,
        localBookingOfferPercentage: '1',
        payLater: true,
        hotelCategory: '2',
        hotelId: '3',
        totalRooms: 5,
        bookedRooms: 1,
        isRegistered: true,
        keyFeatures: ['Free Wifi','TV','Free parking'],
        breakfastAvailable: true, description: "Hotel La Vinci offers top-notch services and amenities, ensuring guests experience utmost comfort. Share you photos and respond to emails at your convenience, thanks to the free Wi-Fi internet access offered by hotel.Should you require transportation to or from the airport, hotel is able too organize it prior to your arrival date. Visitors can take advantage of the accessible parking options directly at the hotel.Smoking is limited to specified smoking zones. Begin your holiday on a high note. At Hotel La Vinci, your morning sare greeted with a delightful, free breakfast. Experience thede light of a fresh morning by savoring excellent coffee at the cafe situated within hotel.Should you prefer not to venture out for a meal, the enticing culinary choices at hotel are always available for your satisfaction.Indulge in the numerous pursuits available at Hotel La Vinci. For individuals who don't want to skip their exercise routine, visiting the hotel fitness center ensures you maintain your vitality and wellness.",
      ),
    ];
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(myBooking,style:
        textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              upcomingTrips,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            MyBookingCard(hotelModel: hotels.first, isUpcoming: true,),
            const SizedBox(height: 32),
            const Text(
              lastTrip,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Column(
              children: hotels.map((hotel) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HotelScreen(hotelModel: hotel,),
                          ),
                        );
                      },
                      child: MyBookingCard(hotelModel: hotel, isUpcoming: false,),
                    ),
                    const Gap(20),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
