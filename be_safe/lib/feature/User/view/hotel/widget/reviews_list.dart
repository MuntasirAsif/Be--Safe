import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ReviewsList extends StatelessWidget {
  const ReviewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(2, (index) => const ReviewItem()),
    );
  }
}

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: const Text(
                      '5.0',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text('Very Good',style: textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),)
                ],
              ),
              Column(
                children: [
                  Text('4.9',style: textTheme.bodySmall,),
                  Text('Cleanliness',style: textTheme.bodySmall,),
                ],
              ),
              Column(
                children: [
                  Text('4.8',style: textTheme.bodySmall,),
                  Text('Staff',style: textTheme.bodySmall,),
                ],
              ),
              Column(
                children: [
                  Text('5.0',style: textTheme.bodySmall,),
                  Text('Location',style: textTheme.bodySmall,),
                ],
              ),
            ],
          ),
          const Gap(20),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: const Text(
                  '5.0',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Superb',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              const Text('Feb 2024'),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.',
          ),
          const Gap(8),
          const Text(
            'Business Traveller',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text('Johnathon'),
          const Divider(),
        ],
      ),
    );
  }
}
