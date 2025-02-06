import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HotelInfoForm extends StatelessWidget {
  const HotelInfoForm({
    super.key,
    required this.nameController,
    required this.locationController,
    required this.descriptionController,
    required this.priceController,
    required this.discountController,
  });

  final TextEditingController nameController;
  final TextEditingController locationController;
  final TextEditingController descriptionController;
  final TextEditingController priceController;
  final TextEditingController discountController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: nameController,
          decoration: const InputDecoration(labelText: 'Hotel Name'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter hotel name';
            }
            return null;
          },
        ),
        const Gap(20),
        TextFormField(
          controller: locationController,
          decoration: const InputDecoration(labelText: 'Location'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter hotel location';
            }
            return null;
          },
        ),
        const Gap(20),
        TextFormField(
          controller: descriptionController,
          maxLines: 5,
          decoration: const InputDecoration(labelText: 'Description'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a description';
            }
            return null;
          },
        ),
        const Gap(20),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Price'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter price';
                  }
                  return null;
                },
              ),
            ),
            const Gap(10),
            Expanded(
              child: TextFormField(
                controller: discountController,
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(labelText: 'Discount Percent'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter price';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
