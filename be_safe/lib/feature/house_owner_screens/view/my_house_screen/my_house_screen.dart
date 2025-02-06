import 'package:be_safe/feature/User/repository/hotel_repository.dart';
import 'package:be_safe/widgets/Card/key_feature.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:be_safe/model/hotel_model.dart';
import '../../../../constant/color_string.dart';
import '../../../../widgets/Card/image_slider.dart';
import '../../../../widgets/common_widgets/button.dart';
import 'edit_house_info/edit_hotel_screen.dart';

class MyHouseScreen extends StatefulWidget {
  const MyHouseScreen({super.key});

  @override
  State<MyHouseScreen> createState() => _MyHouseScreenState();
}

class _MyHouseScreenState extends State<MyHouseScreen> {
  late HotelModel hotelModel;
  bool isLoading = true;
  final String hotelId = FirebaseAuth.instance.currentUser!.uid;
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
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });

      if (kDebugMode) {
        print('Error fetching hotel data: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Hotel",
          style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                      height: 200,
                      child: ImageSlider(
                        images: hotelModel.imageUrl,
                      )),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: device.width * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          hotelModel.name,
                          style: textTheme.titleLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${hotelModel.hotelCategory}★ - Star Hotel',
                          style: textTheme.bodyMedium!
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            Text(
                              hotelModel.location,
                              style: textTheme.bodyMedium!
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              ' View Map',
                              style: textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.labelTextColor),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: 20,
                              width: 40,
                              decoration: BoxDecoration(
                                color: AppColors.ratingColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                  child: Text(
                                hotelModel.rating.toString(),
                                style: textTheme.bodyMedium!
                                    .copyWith(fontWeight: FontWeight.w500),
                              )),
                            ),
                            Text(
                              ' Good | 80 review',
                              style: textTheme.bodyMedium!
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const Gap(5),
                        Container(
                          height: 25,
                          width: 150,
                          decoration: BoxDecoration(
                            color: AppColors.includedFeature,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                              child: Text(
                            hotelModel.breakfastAvailable
                                ? 'Breakfast included'
                                : 'Breakfast not included',
                            style: textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.blackColor),
                          )),
                        ),
                        Text(
                          '20 People reviewing',
                          style:
                              textTheme.bodyMedium!.copyWith(color: Colors.red),
                        ),
                        const Gap(5),
                        SizedBox(
                            height: 50,
                            child: ButtonWidget(
                              text: 'Reserve for BDT${hotelModel.price}',
                              titleSize: 16,
                            )),
                        const Gap(10),
                        const Divider(
                          color: AppColors.blackColor,
                        ),
                        const Gap(10),
                        KeyFeature(keyFeature: hotelModel.keyFeatures),
                        const Gap(10),
                        const Divider(
                          color: AppColors.blackColor,
                        ),
                        Text(
                          'About This Hotel',
                          style: textTheme.headlineMedium!.copyWith(),
                        ),
                        const Gap(10),
                        Text(
                          hotelModel.description,
                          style: textTheme.bodyMedium,
                        ),
                        const Gap(10),
                        const Divider(
                          color: AppColors.blackColor,
                        ),
                        Text(
                          'Hotel Location',
                          style: textTheme.headlineMedium!.copyWith(),
                        ),
                        const Image(
                          image: AssetImage(
                              'assets/images/logo/Hotel Location.png'),
                        ),
                        const Gap(20),
                        Center(
                          child: SizedBox(
                              width: 200,
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EditHotelScreen(
                                          hotel: hotelModel,
                                          isRegistered: true,
                                          houseOwner: null,
                                        ),
                                      ),
                                    );
                                  },
                                  child: ButtonWidget(
                                    text: 'Edit',
                                  ))),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
