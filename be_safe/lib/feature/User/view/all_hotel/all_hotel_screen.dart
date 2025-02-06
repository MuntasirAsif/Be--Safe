import 'package:be_safe/feature/User/view/all_hotel/widget/all_hotel_card.dart';
import 'package:be_safe/feature/User/view/hotel/hotel_screen.dart';
import 'package:be_safe/feature/User/view/search/search_screen.dart';
import 'package:be_safe/constant/color_string.dart';
import 'package:be_safe/model/hotel_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../constant/image_string.dart';
import '../../../../constant/text_string.dart';
import '../../../../widgets/Card/place_card.dart';

class AllHotelScreen extends StatelessWidget {
  AllHotelScreen({super.key});

  final List<HotelModel> hotels = [
    HotelModel(
      location: 'Barambad',
      name: 'Megh Bari Resort',
      imageUrl: [
        'http://www.oceanparadisehotel.com/storage/sliders/slider_1567496889.png',
        'https://cf.bstatic.com/xdata/images/hotel/max1024x768/283183777.jpg?k=899b1542446c88268f790cf9968ddeffe42a7b24c7b228069de09413d5275822&o=&hp=1',
        'http://www.oceanparadisehotel.com/storage/sliders/slider_1567496889.png',
        'https://cf.bstatic.com/xdata/images/hotel/max1024x768/283183777.jpg?k=899b1542446c88268f790cf9968ddeffe42a7b24c7b228069de09413d5275822&o=&hp=1',
        'http://www.oceanparadisehotel.com/storage/sliders/slider_1567496889.png',
      ],
      rating: 5.0,
      reviews: 35,
      price: '3500',
      priceInfo: 'Per Night',
      discount: '15',
      vipStatus: true,
      localBookingOfferPercentage: '1',
      payLater: true,
      hotelCategory: '',
      hotelId: '1',
      totalRooms: 5,
      bookedRooms: 1,
      isRegistered: true,
      keyFeatures: ['Free Wifi','TV','Free parking'],
      breakfastAvailable: true,
      description:
          "Hotel La Vinci offers top-notch services and amenities, ensuring guests experience utmost comfort. Share you photos and respond to emails at your convenience, thanks to the free Wi-Fi internet access offered by hotel.Should you require transportation to or from the airport, hotel is able too organize it prior to your arrival date. Visitors can take advantage of the accessible parking options directly at the hotel.Smoking is limited to specified smoking zones. Begin your holiday on a high note. At Hotel La Vinci, your morning sare greeted with a delightful, free breakfast. Experience thede light of a fresh morning by savoring excellent coffee at the cafe situated within hotel.Should you prefer not to venture out for a meal, the enticing culinary choices at hotel are always available for your satisfaction.Indulge in the numerous pursuits available at Hotel La Vinci. For individuals who don't want to skip their exercise routine, visiting the hotel fitness center ensures you maintain your vitality and wellness.",
    ),
    HotelModel(
      location: "Cox's Bazaar",
      name: 'European Resort',
      imageUrl: [
        'https://cf.bstatic.com/xdata/images/hotel/max1024x768/283183777.jpg?k=899b1542446c88268f790cf9968ddeffe42a7b24c7b228069de09413d5275822&o=&hp=1',
        'http://www.oceanparadisehotel.com/storage/sliders/slider_1567496889.png',
        'https://cf.bstatic.com/xdata/images/hotel/max1024x768/283183777.jpg?k=899b1542446c88268f790cf9968ddeffe42a7b24c7b228069de09413d5275822&o=&hp=1',
        'http://www.oceanparadisehotel.com/storage/sliders/slider_1567496889.png',
        'https://cf.bstatic.com/xdata/images/hotel/max1024x768/283183777.jpg?k=899b1542446c88268f790cf9968ddeffe42a7b24c7b228069de09413d5275822&o=&hp=1',
        'http://www.oceanparadisehotel.com/storage/sliders/slider_1567496889.png',
      ],
      rating: 4.5,
      reviews: 20,
      price: '3000',
      priceInfo: 'Per Night',
      discount: '10',
      vipStatus: true,
      localBookingOfferPercentage: '1',
      payLater: true,
      hotelCategory: '',
      hotelId: '2',
      totalRooms: 5,
      bookedRooms: 1,
      isRegistered: true,
      keyFeatures: ['Free Wifi','TV','Free parking'],
      breakfastAvailable: true,
      description:
          "Hotel La Vinci offers top-notch services and amenities, ensuring guests experience utmost comfort. Share you photos and respond to emails at your convenience, thanks to the free Wi-Fi internet access offered by hotel.Should you require transportation to or from the airport, hotel is able too organize it prior to your arrival date. Visitors can take advantage of the accessible parking options directly at the hotel.Smoking is limited to specified smoking zones. Begin your holiday on a high note. At Hotel La Vinci, your morning sare greeted with a delightful, free breakfast. Experience thede light of a fresh morning by savoring excellent coffee at the cafe situated within hotel.Should you prefer not to venture out for a meal, the enticing culinary choices at hotel are always available for your satisfaction.Indulge in the numerous pursuits available at Hotel La Vinci. For individuals who don't want to skip their exercise routine, visiting the hotel fitness center ensures you maintain your vitality and wellness.",
    ),
    HotelModel(
      location: 'Barambad',
      name: 'Megh Bari Resort',
      imageUrl: [
        'http://www.oceanparadisehotel.com/storage/sliders/slider_1567496889.png'
      ],
      rating: 5.0,
      reviews: 35,
      price: '3500',
      priceInfo: 'Per Night',
      discount: '15',
      vipStatus: true,
      localBookingOfferPercentage: '1',
      payLater: true,
      hotelCategory: '',
      hotelId: '3',
      totalRooms: 5,
      bookedRooms: 1,
      isRegistered: true,
      keyFeatures: ['Free Wifi','TV','Free parking'],
      breakfastAvailable: true,
      description:
          "Hotel La Vinci offers top-notch services and amenities, ensuring guests experience utmost comfort. Share you photos and respond to emails at your convenience, thanks to the free Wi-Fi internet access offered by hotel.Should you require transportation to or from the airport, hotel is able too organize it prior to your arrival date. Visitors can take advantage of the accessible parking options directly at the hotel.Smoking is limited to specified smoking zones. Begin your holiday on a high note. At Hotel La Vinci, your morning sare greeted with a delightful, free breakfast. Experience thede light of a fresh morning by savoring excellent coffee at the cafe situated within hotel.Should you prefer not to venture out for a meal, the enticing culinary choices at hotel are always available for your satisfaction.Indulge in the numerous pursuits available at Hotel La Vinci. For individuals who don't want to skip their exercise routine, visiting the hotel fitness center ensures you maintain your vitality and wellness.",
    ),
    // Add more hotels here
  ];

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: device.height * 0.03,
              backgroundImage: const AssetImage(logo),
            ),
            Gap(device.width * 0.05),
            Text(
              beSafe,
              style:
                  textTheme.displaySmall!.copyWith(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: device.width * 0.03),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.location_pin,
                    size: 30,
                  ),
                  const Gap(2),
                  Text(
                    'Location',
                    style: textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.w600),
                  )
                ],
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    PlaceCard(
                      image:
                          'https://d2u0ktu8omkpf6.cloudfront.net/48a7a18ef2989364a42ef81dd25cc492f5bf85d88122b25a.jpg',
                      location: "Sundorban",
                      address: 'Satkhira Division, Bangladesh',
                    ),
                    PlaceCard(
                      image:
                          'https://mediaim.expedia.com/destination/1/5ce11f681635ca2ebe2ce691b1aa0ea9.jpg',
                      location: "Sylhet",
                      address: 'Sylhet Division, Bangladesh',
                    ),
                    PlaceCard(
                      image:
                          'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f4/Midway_to_Konglak_Hill%2C_Khagrachari%2C_Bangladesh.jpg/1280px-Midway_to_Konglak_Hill%2C_Khagrachari%2C_Bangladesh.jpg',
                      location: "Khagrachari",
                      address: 'Khagrachari Division, Bangladesh',
                    ),
                    PlaceCard(
                      image:
                          'https://www.shutterstock.com/image-photo/beauty-saint-martin-island-coxs-600nw-2308207335.jpg',
                      location: "Cox's Bazaar",
                      address: 'Cox’s Bazaar Division, Bangladesh',
                    ),
                  ],
                ),
              ),
              Container(
                height: 450,
                width: device.width,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.baseColor, // Your base color
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: hotels.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HotelScreen(
                                        hotelModel: hotels[index],
                                      )));
                        },
                        child: AllHotelCard(hotelModel: hotels[index]));
                  },
                ),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.baseColor, // Base color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Text(
                      seeAll,
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
