import 'package:be_safe/feature/User/view/hotel/widget/bottom_section.dart';
import 'package:be_safe/feature/User/view/hotel/widget/hotel_screen_header.dart';
import 'package:be_safe/model/hotel_model.dart';
import 'package:be_safe/widgets/Card/image_slider.dart';
import 'package:be_safe/feature/User/view/hotel/widget/reviews_list.dart';
import 'package:be_safe/feature/User/view/hotel/widget/top_reason_to_book.dart';
import 'package:be_safe/widgets/Card/key_feature.dart';
import 'package:be_safe/widgets/common_widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import '../../../../constant/color_string.dart';
import '../../../../constant/image_string.dart';
import '../../../../constant/text_string.dart';

class HotelScreen extends StatefulWidget {
  final HotelModel hotelModel;

  const HotelScreen(
      {super.key,
       required this.hotelModel});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  final ScrollController _scrollController = ScrollController();
  bool isEndOfPage = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      setState(() {
        isEndOfPage = true;
      });
    } else {
      setState(() {
        isEndOfPage = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var format = DateFormat('dd MMM yyyy');
    var dateString = format.format(DateTime.now());
    final device = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: device.height * 0.08,
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: device.width * 0.03),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HotelScreenHeader(textTheme: textTheme, dateString: dateString),
              const Gap(10),
              SizedBox(
                  height: 200,
                  child: ImageSlider(
                    images: widget.hotelModel.imageUrl,
                  )),
              const Gap(10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.hotelModel.name,
                    style: textTheme.titleLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${widget.hotelModel.hotelCategory}★ - Star Hotel',
                    style: textTheme.bodyMedium!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  Row(
                    children: [
                      Text(
                        widget.hotelModel.location,
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
                              widget.hotelModel.rating.toString(),
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
                          widget.hotelModel.breakfastAvailable
                          ? 'Breakfast included'
                          : 'Breakfast not included',
                      style: textTheme.bodyMedium!
                          .copyWith(fontWeight: FontWeight.w500,color: AppColors.blackColor),
                    )),
                  ),
                  Text(
                    '20 People reviewing',
                    style: textTheme.bodyMedium!.copyWith(color: Colors.red),
                  ),
                  const Gap(5),
                  SizedBox(
                      height: 50,
                      child: ButtonWidget(
                        text: 'Reserve for BDT${widget.hotelModel.price}',
                        titleSize: 16,
                      )),
                  const Gap(10),
                  const Divider(
                    color: AppColors.blackColor,
                  ),
                  const Gap(10),
                  KeyFeature(keyFeature: widget.hotelModel.keyFeatures),
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
                    widget.hotelModel.description,
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
                    image: AssetImage('assets/images/logo/Hotel Location.png'),
                  ),
                  const Gap(10),
                  const Divider(
                    color: AppColors.blackColor,
                  ),
                  const TopReasonToBook(),
                  const Gap(10),
                  const Divider(
                    color: AppColors.blackColor,
                  ),
                  const ReviewsList(),
                ],
              )
            ],
          ),
        ),
      ),
      bottomSheet: isEndOfPage == false
          ? ClipRRect(
              borderRadius: BorderRadius.zero,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: const BottomSection(),
              ),
            )
          : const SizedBox(),
    );
  }
}
