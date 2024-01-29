import 'package:flutter/material.dart';
import 'dart:async';
import 'profile.dart';
import 'feedback.dart';
import 'todayclass.dart';
import 'timetable.dart';
import 'reports.dart';
import 'syllabus.dart';
import 'announcements.dart';
import 'clginfo.dart';
import 'searchtable.dart';

class MainPage extends StatefulWidget {
  final String? newTitle;
  final String? newDescription;
  final DateTime? endDate;
  final TimeOfDay? endTime;

  MainPage({this.newTitle, this.newDescription, this.endDate, this.endTime});



  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final double imageSize = 60.0;
  final double paddingBetweenImages = 40.0;
  late PageController _pageController;
  int _selectedIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    // Start the automatic sliding after 2 seconds
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      if (_pageController.hasClients) {
        if (_pageController.page == 4) {
          // If it's the last feed, jump to the first feed
          _pageController.animateToPage(
            0,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        } else {
          // Otherwise, smoothly go to the next feed
          _pageController.nextPage(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.cyan,
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ClgInfoPage()),
            );
          },
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ClgInfoPage()),
                    );
                  },
                  child: Image.asset(
                    'images/clg logo.png',
                    width: 60,
                    height: 60,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ClgInfoPage()),
                  );
                },
                child: Text(
                  'PSN COLLEGE OF ENGG\n AND TECH',
                  style: TextStyle(fontSize: 36),
                ),
              ),
            ],
          ),
        ),
        toolbarHeight: 80,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(paddingBetweenImages),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: paddingBetweenImages,
                  mainAxisSpacing: paddingBetweenImages,
                ),
                itemCount: 7,
                itemBuilder: (context, index) {
                  Widget imageWidget;

                  switch (index) {
                    case 0:
                      imageWidget = InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AttendancePage()),
                          );
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
                            MaterialPageRoute(
                                builder: (context) => SearchTablePage()),
                          );
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
                            MaterialPageRoute(
                                builder: (context) => ReportsPage()),
                          );
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
                            MaterialPageRoute(
                                builder: (context) => SyllabusPage()),
                          );
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
                            MaterialPageRoute(
                                builder: (context) => AnnouncementsPage()),
                          );
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
                            MaterialPageRoute(
                                builder: (context) => FeedbackPage()),
                          );
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
                            MaterialPageRoute(
                                builder: (context) => FeedbackPage()),
                          );
                        },
                        child: Image.asset(
                          'images/image7.png',
                          width: imageSize,
                          height: imageSize,
                          fit: BoxFit.cover,
                        ),
                      );
                      break;
                    default:
                      imageWidget = Container();
                  }

                  return imageWidget;
                },
              ),
            ),
          ),
          Container(
            height: 220,
            child: PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              itemCount: 5, // Hardcoded to the number of images for simplicity
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      _showFeedDescription(
                        context,
                        'Feed Title ${index + 1}',
                        widget.newDescription ?? 'Default Description',
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.cyan,
                          width: 8.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Text(
                          'Feed Title ${index + 1}',
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),


      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.cyan,
        iconSize: 40.0,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feedback_outlined),
            label: 'Feedback',
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
              break;
            case 2:
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

  void _showFeedDescription(
      BuildContext context,
      String feedTitle,
      String feedDescription,
      ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(feedTitle),
          content: Text(feedDescription),
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

//This code retains the sliding animation with a static set of feed titles and descriptions. Feel free to customize the content as needed.