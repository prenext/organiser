import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppRatingDialog extends StatefulWidget {
  @override
  _AppRatingDialogState createState() => _AppRatingDialogState();
}

class _AppRatingDialogState extends State<AppRatingDialog> {
  int selectedStars = 0;
  TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      contentPadding: EdgeInsets.all(0.0),
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).cardColor,
            ],
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(),
            SizedBox(height: 20.0),
            _buildEmoji(),
            SizedBox(height: 20.0),
            _buildStarRating(),
            SizedBox(height: 20.0),
            // Container(
            //   width: double.infinity,
            //   child: TextField(
            //     controller: reviewController,
            //     decoration: InputDecoration(
            //       hintText: 'Write your review...',
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(5.0),
            //       ),
            //     ),
            //     maxLines: 4,
            //   ),
            // ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  child: Text("Later"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Perform the action when the user submits the rating, e.g., redirect to the Play Store
                    _submitRating();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  child: Text("Submit"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Text(
          "Rate Us",
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          "How do you feel about the app?",
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildStarRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(5, (index) {
        return IconButton(
          onPressed: () {
            setState(() {
              selectedStars = index + 1;
            });
          },
          icon: Icon(
            index < selectedStars ? Icons.star : Icons.star_border,
            color: Theme.of(context).colorScheme.secondary,
            size: 40.0,
          ),
        );
      }),
    );
  }

  Widget _buildEmoji() {
    IconData emojiIcon;
    switch (selectedStars) {
      case 1:
        emojiIcon = Icons.sentiment_very_dissatisfied;
        break;
      case 2:
        emojiIcon = Icons.sentiment_dissatisfied;
        break;
      case 3:
        emojiIcon = Icons.sentiment_neutral;
        break;
      case 4:
        emojiIcon = Icons.sentiment_satisfied;
        break;
      case 5:
        emojiIcon = Icons.sentiment_very_satisfied;
        break;
      default:
        emojiIcon = Icons.sentiment_satisfied;
        break;
    }

    return Icon(
      emojiIcon,
      size: 80.0,
      color: Theme.of(context).colorScheme.secondary,
    );
  }

  void _submitRating() {
    print("User rated with $selectedStars stars");
    // For now, just print the review to the console
    print("Review: ${reviewController.text}");
  }

  // ignore: unused_element
  Future<void> _launchPlayStore(String appId) async {
    final url = 'https://play.google.com/store/apps/details?id=$appId';
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
