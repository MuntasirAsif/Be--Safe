import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../widgets/multiple_imagepicker_widgets/multi_image_picker.dart';


class HouseOwnerInfo extends StatelessWidget {
  HouseOwnerInfo({
    super.key,
    required this.textTheme,
    required this.nameController,
    required this.ownerAddressController,
    required this.ownerContactController,
    required this.ownerNIDnoController,
    required this.houseOwnerDocument,
    required this.uid,
  }) ;

  final TextTheme textTheme;
  TextEditingController nameController;
  List<String> houseOwnerDocument;
  String uid;
  TextEditingController ownerAddressController;
  TextEditingController ownerContactController;
  TextEditingController ownerNIDnoController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Owner Information:',
          style: textTheme.titleLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const Gap(20),
        TextFormField(
          controller: nameController,
          decoration:
          const InputDecoration(labelText: 'Name as NID'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter hotel name';
            }
            return null;
          },
        ),
        const Gap(20),
        TextFormField(
          controller: ownerContactController,
          keyboardType: TextInputType.phone,
          decoration:
          const InputDecoration(labelText: 'Phone Number'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter house owner address';
            }
            return null;
          },
        ),
        const Gap(20),
        TextFormField(
          controller: ownerAddressController,
          decoration:
          const InputDecoration(labelText: 'Address'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter house owner address';
            }
            return null;
          },
        ),
        const Gap(20),
        TextFormField(
          controller: ownerNIDnoController,
          decoration:
          const InputDecoration(labelText: 'NID no'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'House owner NID';
            }
            return null;
          },
        ),
        const Gap(20),
        Text(
          'NID Images',
          style: textTheme.bodyLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        MultipleImagePickerWidget(imageLink: houseOwnerDocument, userID: uid, collection: 'HouseOwner',),
        const SizedBox(height: 20),
      ],
    );
  }
}