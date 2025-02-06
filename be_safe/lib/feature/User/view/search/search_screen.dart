import 'package:be_safe/feature/User/view/hotel/hotel_screen.dart';
import 'package:be_safe/feature/User/view/search/widget/date_section.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../model/hotel_model.dart';
import '../../../../widgets/Card/hotel_card.dart';
import '../../repository/hotel_repository.dart';
import 'widget/select_room_item.dart';
import 'package:be_safe/constant/color_string.dart';
import 'package:be_safe/constant/text_string.dart';
import 'package:be_safe/widgets/common_widgets/button.dart';
import 'package:be_safe/widgets/text_field_widget/custom_text_field.dart';
import '../../../../constant/image_string.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Future<List<HotelModel>>? hotels;

  @override
  void initState() {
    hotels = HotelRepository().getAllHotels();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: device.height * 0.08,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: device.width * 0.05),
          child: Column(
            children: [
              const Gap(10),
              CustomTextField(
                labelText: 'Where to',
                icon: Icons.search,
              ),
              const Gap(15),
              DateSection(device: device),
              const Gap(15),
              const SelectRoomItem(),
              const Gap(40),
              SizedBox(
                height: 50,
                child: ButtonWidget(
                  text: 'Search Hotels',
                  buttonColor: AppColors.buttonBgColor,
                  textColor: AppColors.labelTextColor,
                ),
              ),
              const Gap(20),
              FutureBuilder<List<HotelModel>>(
                future: hotels,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }

                  if (snapshot.hasData) {
                    List<HotelModel> hotels = snapshot.data!;
                    return Column(
                      children: hotels.map((hotel) {
                        return Column(
                          children: [
                            // Display hotel information using HotelCard or other widgets
                            InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HotelScreen(hotelModel: hotel)));
                                },
                                child: HotelCard(hotel: hotel)),
                            const SizedBox(
                                height: 20), // Add spacing between hotels
                          ],
                        );
                      }).toList(),
                    );
                  }

                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
