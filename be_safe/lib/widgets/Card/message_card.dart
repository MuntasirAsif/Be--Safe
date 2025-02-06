import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../../model/message_model.dart';

class MessageCard extends StatelessWidget {
  final bool isSentByMe;
  final MessageModel message;
  final VoidCallback? onBookNowPressed;

  const MessageCard({super.key, required this.message, this.onBookNowPressed, required this.isSentByMe});

  @override
  Widget build(BuildContext context) {
    // Determine theme colors based on the current theme
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final sentMessageColor = isDarkMode
        ? const LinearGradient(colors: [Color(0xFF1E1E1E), Color(0xFF292929)])
        : const LinearGradient(colors: [Color(0xFF5D9CEC), Color(0xFF4A8BF1)]);
    final receivedMessageColor = isDarkMode
        ? const LinearGradient(colors: [Color(0xFF444444), Color(0xFF565656)])
        : const LinearGradient(colors: [Color(0xFFE0E0E0), Color(0xFFFAFAFA)]);

    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          gradient: isSentByMe ? sentMessageColor : receivedMessageColor,
          borderRadius: BorderRadius.circular(20).copyWith(
            bottomLeft: isSentByMe ? const Radius.circular(20) : const Radius.circular(0),
            bottomRight: isSentByMe ? const Radius.circular(0) : const Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, 4),
              blurRadius: 12,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            // Handling Book Now Message
            if (message.isBookNowMessage)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.messageContent ?? '',
                    style: TextStyle(
                      color: isSentByMe ? Colors.white : Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: onBookNowPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'Book Now',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.subdirectory_arrow_right_outlined,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

            // Handling regular text message
            if (message.messageContent != null && !message.isBookNowMessage)
              Text(
                message.messageContent!,
                style: TextStyle(
                  color: isSentByMe ? Colors.white : Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),

            // Handling image message
            if (message.imageUrl != null && !message.isBookNowMessage)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    message.imageUrl!,
                    width: 200,
                    height: 150,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.broken_image,
                      size: 100,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 8),
            // Timestamp
            Text(
              DateFormat('h:mm a').format(message.timestamp),
              style: TextStyle(
                color: isSentByMe
                    ? Colors.white.withOpacity(0.7)
                    : Colors.black.withOpacity(0.6),
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
