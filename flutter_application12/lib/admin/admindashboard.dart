import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application12/admin/add_doctor.dart';
import 'package:flutter_application12/admin/login_page_admin.dart';

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        titleTextStyle: const TextStyle(
          fontFamily: 'FontMain',
          color: Color.fromARGB(255, 199, 164, 106),
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        backgroundColor: Colors.white, // Change app bar background color

        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Color.fromARGB(255, 179, 9, 9),
              size: 30,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPageAdmin()));
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // Horizontal List
                _buildHorizontalList(),
                const SizedBox(height: 1),
                // Greeting Message
                const Text(
                  'Hello there! Welcome to MyDoc...',
                  style: TextStyle(
                    fontFamily: 'FontMain',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 1, 25, 132),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                        onPressed: () {
                           Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AddDoctor()));
                        },
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(0.0),
                            backgroundColor: Colors.blue,
                            fixedSize: Size(250, 100),
                            elevation: 15,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Add Doctor ",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ),
                            Icon(
                              Icons.local_hospital,
                              size: 40,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                SizedBox(height: 40,),
                Container(
                  height: 200,
                  child: PieChart(
                    PieChartData(
                      sections: [
                        PieChartSectionData(
                          value: 70,
                          title: "Client",
                          showTitle: true,
                          color: Colors.green,
                          radius: 70,
                        ),
                        PieChartSectionData(
                          value: 20,
                          title: 'Doctor',
                          showTitle: true,
                          color: Colors.blue,
                          radius: 70,
                        )
                      ],
                    ),
                    
                  ),
                  
                )
              ],
            ),
          ),
        ],
      ),
     
    );
  }

  Widget _buildHorizontalList() {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 265,
      child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          autoPlay: true,
        ),
        items: [
          'assets/images/ca3.jpg',
          'assets/images/diet.png',
          'assets/images/ca2.jpg',
          'assets/images/cover654.jpg',
        ].map((item) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(20), // Circular border radius
                ),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(20), // Circular border radius
                  child: Image.asset(
                    item,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _buildListItem(String text) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 100,
      color: Colors.blue,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

// Method to build the unread notification badge widget
Widget _buildUnreadNotificationBadge() {
  return Container(
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(8),
    ),
    child: const Text(
      '1',
      style: TextStyle(color: Colors.white),
    ),
  );
}
