import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f8fa),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Username", style: TextStyle(fontWeight: FontWeight.w700)),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 70,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff665ce9),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            minimumSize: Size(double.infinity, 40),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.logout, color: Colors.white,),
              SizedBox(width: 20,),
              Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      body: Expanded(
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black12,
                    ),
                    height: 35,
                    width: 35,
                    margin: EdgeInsets.only(right: 10),
                    child: Stack(
                      children: [
                        Icon(Icons.person, color: Colors.white, size: 35),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.lightGreenAccent,
                              shape: BoxShape.circle,
                            ),
                            height: 10,
                            width: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Name",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text("09:30", style: TextStyle(fontSize: 12)),
                          ],
                        ),
                        Text("See You Tomorrow"),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 10);
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
