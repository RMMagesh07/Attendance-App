import 'package:flutter/material.dart';
import 'profile.dart';
import 'feedback.dart';
import 'todayclass.dart';
import 'timetable.dart';
import 'reports.dart';
import 'syllabus.dart';
import 'announcements.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double imageSize = MediaQuery.of(context).size.width / 40; // Adjust the size of the images based on screen width
    final double paddingBetweenImages = 40.0;
    // Sample feed data
    List<String> feedTitles = [
      'Feed 1',
      'Feed 2',
      'Feed 3',
      // Add more feed titles as needed
    ];
    PageController _pageController = PageController();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.cyan,
        title: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              child: Image.asset(
                'images/ABI LOGO.png', // Adjust the path as needed
                width: 60,
                height: 60,
              ),
            ),
            Text('Main Page'),
          ],
        ),
        toolbarHeight: 80, // Set the desired height for the AppBar
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // GridView for images (3 in each row)
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(paddingBetweenImages),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: paddingBetweenImages,
                  mainAxisSpacing: paddingBetweenImages,
                ),
                itemCount: 7, // Adjust the number of items based on your actual data
                itemBuilder: (context, index) {
                  Widget imageWidget;

                  switch (index) {
                    case 0:
                      imageWidget = InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AttendancePage()),
                          );
                          // Handle image click for the first image
                          // Add your navigation logic here
                        },
                        child: Image.asset(
                          'images/image1.png',
                          width: imageSize,
                          height: imageSize,
                          fit: BoxFit.cover,
                        ),
                      );
                      break;
                    case 1:
                      imageWidget = InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TimeTablePage()),
                          );
                          // Handle image click for the second image
                          // Add your navigation logic here
                        },
                        child: Image.asset(
                          'images/image2.png',
                          width: imageSize,
                          height: imageSize,
                          fit: BoxFit.cover,
                        ),
                      );
                      break;
                    case 2:
                      imageWidget = InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ReportsPage()),
                          );
                          // Handle image click for the third image
                          // Add your navigation logic here
                        },
                        child: Image.asset(
                          'images/image3.png',
                          width: imageSize,
                          height: imageSize,
                          fit: BoxFit.cover,
                        ),
                      );
                      break;
                    case 3:
                      imageWidget = InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SyllabusPage()),
                          );
                          // Handle image click for the third image
                          // Add your navigation logic here
                        },
                        child: Image.asset(
                          'images/image4.png',
                          width: imageSize,
                          height: imageSize,
                          fit: BoxFit.cover,
                        ),
                      );
                      break;
                    case 4:
                      imageWidget = InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AnnouncementsPage()),
                          );
                          // Handle image click for the third image
                          // Add your navigation logic here
                        },
                        child: Image.asset(
                          'images/image5.png',
                          width: imageSize,
                          height: imageSize,
                          fit: BoxFit.cover,
                        ),
                      );
                      break;
                    case 5:
                      imageWidget = InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FeedbackPage()),
                          );
                          // Handle image click for the third image
                          // Add your navigation logic here
                        },
                        child: Image.asset(
                          'images/image6.png',
                          width: imageSize,
                          height: imageSize,
                          fit: BoxFit.cover,
                        ),
                      );
                      break;
                    case 6:
                      imageWidget = InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FeedbackPage()),
                          );
                          // Handle image click for the third image
                          // Add your navigation logic here
                        },
                        child: Image.asset(
                          'images/image7.png',
                          width: imageSize,
                          height: imageSize,
                          fit: BoxFit.cover,
                        ),
                      );
                      break;
                  // Add cases for other images...
                    default:
                      imageWidget = Container(); // Placeholder for additional images
                  }

                  return imageWidget;
                },
              ),
            ),
          ),
          // Container with a button below the grid
          Padding(
            padding: EdgeInsets.all(1),
            child: ElevatedButton(
              onPressed: () {
                // Handle button click
                _showFeedsPopup(context, feedTitles);
              },
              child: Text('Feeds'),
              style: ElevatedButtonThemeData(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 90),
              ),
            ),
          ),
        ],
      ),



      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feedback),
            label: 'Feedback',
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
            // Navigate to Profile page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
              break;
            case 1:
            // Navigate to Home page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
              );
              break;
            case 2:
            // Navigate to Feedback page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeedbackPage()),
              );
              break;
          }
        },
      ),
    );
  }
  // Function to show feeds popup
  void _showFeedsPopup(BuildContext context, List<String> feedTitles) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Feeds'),
          content: SingleChildScrollView(
            child: Column(
              children: feedTitles
                  .map((title) => ListTile(
                title: Text(title),
                onTap: () {
                  // Handle feed title click
                  // You can show the description in another popup or navigate to a new screen
                },
              ))
                  .toList(),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}


