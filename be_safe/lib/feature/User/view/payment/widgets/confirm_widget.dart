import 'package:be_safe/feature/User/view/my_booking/my_booking.dart';
import 'package:be_safe/widgets/common_widgets/button.dart';
import 'package:flutter/material.dart';

class ConfirmWidget extends StatelessWidget {
  const ConfirmWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'BDT2500\nPer night',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
              width: 150,
              height: 60,
              child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyBooking()));
                  },
                  child: ButtonWidget(text: 'Confirm')))
        ],
      ),
    );
  }
}
