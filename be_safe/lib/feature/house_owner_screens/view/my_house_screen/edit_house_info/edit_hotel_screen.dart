import 'package:be_safe/feature/house_owner_screens/controller/house_onwer_controller.dart';
import 'package:be_safe/model/house_owner_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:be_safe/model/hotel_model.dart';
import 'package:gap/gap.dart';
import '../../../../../widgets/multiple_imagepicker_widgets/multi_image_picker.dart';
import '../../../../User/controller/hotel_controller.dart';
import 'Widgets/category_dropdown.dart';
import 'Widgets/hotel_info_form.dart';
import 'Widgets/house_owner_info.dart';
import 'Widgets/key_feature_dropdown.dart';

class EditHotelScreen extends ConsumerStatefulWidget {
  final HotelModel? hotel;
  final HouseOwnerModel? houseOwner;
  final bool isRegistered;

  const EditHotelScreen({
    super.key,
    required this.hotel,
    required this.houseOwner,
    required this.isRegistered,
  });

  @override
  ConsumerState<EditHotelScreen> createState() => _EditHotelScreenState();
}

class _EditHotelScreenState extends ConsumerState<EditHotelScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isBreakfastFree = false;
  bool payLaterAvailable = false;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late TextEditingController nameController;
  late TextEditingController locationController;
  late TextEditingController descriptionController;
  late TextEditingController priceController;
  late TextEditingController discountController;
  late TextEditingController _ratingController;
  late TextEditingController ownerNameController;
  late TextEditingController ownerAddressController;
  late TextEditingController ownerContactController;
  late TextEditingController ownerNIDnoController;

  String _selectedCategory = 'Select Category';

  final List<String> keyFeature = [
    'Free Breakfast',
    'Free Wifi',
    'TV',
    'Free Parking',
    'Dressing Table',
    'Free Soap',
    'Hair Dryer'
  ];
  List<String> selectedFeature = [];
  List<String> hotelImages = [];
  List<String> houseOwnerDocument = [];

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.hotel?.name);
    locationController = TextEditingController(text: widget.hotel?.location);
    descriptionController =
        TextEditingController(text: widget.hotel?.description);
    priceController = TextEditingController(text: widget.hotel?.price);
    discountController = TextEditingController(text: widget.hotel?.discount);
    _ratingController =
        TextEditingController(text: widget.hotel?.rating.toString());
    _selectedCategory = widget.hotel?.hotelCategory ?? 'Select Category';
    isBreakfastFree = widget.hotel?.breakfastAvailable ?? false;
    payLaterAvailable = widget.hotel?.payLater ?? false;
    selectedFeature = widget.hotel?.keyFeatures ?? [];
    nameController = TextEditingController(text: widget.hotel?.name ?? '');
    locationController =
        TextEditingController(text: widget.hotel?.location ?? '');
    descriptionController =
        TextEditingController(text: widget.hotel?.description ?? '');
    priceController =
        TextEditingController(text: widget.hotel?.price.toString() ?? '');
    _ratingController =
        TextEditingController(text: widget.hotel?.rating.toString() ?? '0.0');
    ownerNameController = TextEditingController(
        text: widget.houseOwner?.ownerName.toString());
    ownerContactController = TextEditingController(
        text: widget.houseOwner?.phoneNumber.toString());
    ownerAddressController = TextEditingController(
        text: widget.houseOwner?.address.toString() );
    ownerNIDnoController = TextEditingController(
        text: widget.houseOwner?.nidNumber.toString());
  }

  @override
  void dispose() {
    nameController.dispose();
    locationController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    _ratingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final hotelController = ref.read(hotelControllerProvider.notifier);
    final houseOwnerController = ref.read(houseOwnerProvider.notifier);
    User? user = firebaseAuth.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isRegistered ? 'Edit Hotel' : 'Hotel Registration',
          style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HotelInfoForm(
                  nameController: nameController,
                  locationController: locationController,
                  descriptionController: descriptionController,
                  priceController: priceController,
                  discountController: discountController,
                ),
                const Gap(
                    30), // Use the CategoryDropdown widget for category selection
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text('Category: '),
                    CategoryDropdown(
                      initialCategory: _selectedCategory,
                      onCategorySelected: (String selectedCategory) {
                        setState(() {
                          _selectedCategory = selectedCategory;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        value: isBreakfastFree,
                        onChanged: (value) {
                          setState(() {
                            isBreakfastFree = value!;
                          });
                        }),
                    const Text("Free Breakfast Available")
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        value: payLaterAvailable,
                        onChanged: (value) {
                          setState(() {
                            payLaterAvailable = value!;
                          });
                        }),
                    const Text("Pay Later Available")
                  ],
                ),
                KeyFeatureDropdown(
                  keyFeature: keyFeature,
                  selectedFeature: selectedFeature,
                ),
                const SizedBox(height: 20),
                Text(
                  'Upload Hotel Images',
                  style: textTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                MultipleImagePickerWidget(
                  imageLink: hotelImages,
                  userID: user!.uid.toString(),
                  collection: 'Hotel',
                ),
                const SizedBox(height: 40),

                widget.isRegistered
                    ? const SizedBox()
                    : HouseOwnerInfo(
                        textTheme: textTheme,
                        nameController: ownerNameController,
                        houseOwnerDocument: houseOwnerDocument,
                        uid: user.uid,
                        ownerAddressController: ownerAddressController,
                        ownerNIDnoController: ownerNIDnoController,
                  ownerContactController: ownerContactController,
                      ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {

                        final updatedHotel = HotelModel(
                          hotelId: user.uid.toString(),
                          name: nameController.text.toString(),
                          description: descriptionController.text.toString(),
                          hotelCategory: '_selectedCategory',
                          price: priceController.text.toString(),
                          discount: discountController.text.toString(),
                          location: locationController.text.toString(),
                          imageUrl: hotelImages,
                          rating: 0,
                          reviews: 0,
                          priceInfo: '',
                          vipStatus: false,
                          localBookingOfferPercentage: '',
                          payLater: payLaterAvailable,
                          totalRooms: 4,
                          bookedRooms: 2,
                          isRegistered: true,
                          keyFeatures: ['dtyu', 'utyut'],
                          breakfastAvailable: false,
                        );
                        if (kDebugMode) {
                          print(updatedHotel);
                        }
                        hotelController.createHotel(updatedHotel);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Hotel details updated')),
                        );
                        if(!widget.isRegistered){
                          final houseOwner = HouseOwnerModel(
                              ownerName: ownerNameController.text.toString(),
                              address: ownerAddressController.text.toString(),
                              nidNumber: ownerNIDnoController.text.toString(),
                              ownerDocImageUrl: houseOwnerDocument,
                              hotelId: user.uid,
                              phoneNumber: ownerContactController.text.toString(),
                          );
                          houseOwnerController.addHouseOwner(houseOwner);
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
