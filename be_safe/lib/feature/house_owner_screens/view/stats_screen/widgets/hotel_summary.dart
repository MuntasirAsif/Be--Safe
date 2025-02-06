import 'package:flutter/material.dart';
import '../../../../../model/hotel_model.dart'; // Update with the correct path

class HotelSummary extends StatefulWidget {
  final HotelModel hotelModel;

  const HotelSummary({super.key, required this.hotelModel});

  @override
  _HotelSummaryState createState() => _HotelSummaryState();
}

class _HotelSummaryState extends State<HotelSummary> {
  bool _isExpanded = false; // To track the expanded state

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.hotelModel.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: widget.hotelModel.imageUrl.isNotEmpty
                      ? NetworkImage(widget.hotelModel.imageUrl.first)
                      : null,
                  child: widget.hotelModel.imageUrl.isEmpty
                      ? const Icon(Icons.broken_image, size: 40, color: Colors.grey) // Fallback icon
                      : null,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Location: ${widget.hotelModel.location}'),
                      Text('Rating: ${widget.hotelModel.rating}'),
                      Text('Reviews: ${widget.hotelModel.reviews}'),
                      Text('Price: \$${widget.hotelModel.price} ${widget.hotelModel.priceInfo}'),
                      Text('Discount: ${widget.hotelModel.discount}%'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text('Description:'),
            const SizedBox(height: 5),
            // Conditionally display the full or truncated text
            Text(
              widget.hotelModel.description,
              maxLines: _isExpanded ? null : 5, // Show more or limit to 5 lines
              overflow: _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
            ),
            // Show more or show less button
            TextButton(
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded; // Toggle expanded state
                });
              },
              child: Text(_isExpanded ? 'Show Less' : 'Show More'),
            ),
          ],
        ),
      ),
    );
  }
}
