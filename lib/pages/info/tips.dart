import 'package:flutter/material.dart';

class TipsPage extends StatefulWidget {
  @override
  _TipsPageState createState() => _TipsPageState();
}

class _TipsPageState extends State<TipsPage> {
  List<int> likesCount = List.generate(8, (index) => 0);
  List<int> dislikesCount = List.generate(8, (index) => 0);
  List<bool> likedStatus = List.generate(8, (index) => false);
  List<bool> dislikedStatus = List.generate(8, (index) => false);
  List<bool> actionTaken = List.generate(8, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Organizer Tips"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            8,
            (index) => _buildTipCard(
              title: "Tip ${index + 1}",
              description: _getTipDescription(index),
              likes: likesCount[index],
              dislikes: dislikesCount[index],
              isLiked: likedStatus[index],
              isDisliked: dislikedStatus[index],
              onLike: () => _handleLike(index),
              onDislike: () => _handleDislike(index),
            ),
          ),
        ),
      ),
    );
  }

  String _getTipDescription(int index) {
    // Replace with real-life tips related to your Organizer app
    switch (index) {
      case 0:
        return "Stay organized by prioritizing your tasks and using the app's calendar.";
      case 1:
        return "Set achievable goals using the goal tracking feature.";
      case 2:
        return "Monitor your meals for a healthier lifestyle with the meal tracking feature.";
      case 3:
        return "Categorize Tasks Organize your tasks by categorizing them. It makes it easier to find and manage.";
      case 4:
        return "Prioritize Tasks Use priority settings to focus on what matters most.";
      case 5:
        return "Utilize Reminders Set reminders for important tasks to stay on top of your schedule.";
      case 6:
        return "Explore Analytics Check analytics to understand your productivity patterns.";
      case 7:
        return "Try Different Themes Customize the app's theme to make it visually appealing.";
      case 8:
        return "Explore Suggestions Let Organizer's intelligent suggestions guide you in organizing your tasks.";
      default:
        return "Explore Suggestions Let Organizer's intelligent suggestions guide you in organizing your tasks.";
    }
  }

  Widget _buildTipCard({
    required String title,
    required String description,
    required int likes,
    required int dislikes,
    required bool isLiked,
    required bool isDisliked,
    required VoidCallback onLike,
    required VoidCallback onDislike,
  }) {

    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => _handleAction(onLike),
                  icon: Icon(
                    isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text("$likes Likes"),
                IconButton(
                  onPressed: () => _handleAction(onDislike),
                  icon: Icon(
                    isDisliked ? Icons.thumb_down : Icons.thumb_down_outlined,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text("$dislikes Dislikes"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  
  void _handleAction(VoidCallback actionCallback) {
      setState(() {
        actionCallback();
      });
  }

  void _handleLike(int index) {
    if (!likedStatus[index] && !dislikedStatus[index]) {
      setState(() {
        likedStatus[index] = true;
        likesCount[index]++;
      });
    } else if (likedStatus[index]) {
      setState(() {
        likedStatus[index] = false;
        likesCount[index]--;
      });
    } else if (dislikedStatus[index]) {
      setState(() {
        dislikedStatus[index] = false;
        dislikesCount[index]--;
        likedStatus[index] = true;
        likesCount[index]++;
      });
    }
  }

  void _handleDislike(int index) {
    if (!likedStatus[index] && !dislikedStatus[index]) {
      setState(() {
        dislikedStatus[index] = true;
        dislikesCount[index]++;
      });
    } else if (dislikedStatus[index]) {
      setState(() {
        dislikedStatus[index] = false;
        dislikesCount[index]--;
      });
    } else if (likedStatus[index]) {
      setState(() {
        dislikedStatus[index] = true;
        dislikesCount[index]++;
        likedStatus[index] = false;
        likesCount[index]--;
      });
    }
  }

}
