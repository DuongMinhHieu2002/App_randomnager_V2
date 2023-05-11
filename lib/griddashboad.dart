import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:untitled14/Random_password_scrreeen.dart';
import 'package:randomator/Random_password_scrreeen.dart';
// import 'package:untitled14/Randomtopic_Screen.dart';
import './Randomtopic_Screen.dart';
// import 'package:untitled14/yesno_screen.dart';
import './yesno_screen.dart';
import 'RandomNumberscreen.dart';


class GridDashboard extends StatelessWidget {
  final BuildContext context;
  GridDashboard({required this.context});
  @override
  Widget build(BuildContext context) {
    Items item1 = new Items(
        title: "Random Number",
        img: "assets/images/random-number.jpg",
        onTap: () {
          print("ontap 1");
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RandomNumberPage()),
          );
        });
    Items item2 = new Items(
        title: "Yes or NO", img: "assets/images/yesorno.png", onTap: () {
          print("ontap 2");
          Navigator.push(context, MaterialPageRoute(builder: (context) => RandomYesNopage()));
    });
    Items item3 = new Items(
        title: "Conversation Topic",
        img: "assets/images/random-topic.png",
        onTap: () {
          print("on tap 3");
          Navigator.push(context, MaterialPageRoute(builder: (context) => RandomTextScreen()));
        });
    Items item4 = new Items(
        title: "Random Password",
        img: "assets/images/randompassword.jpg",
        onTap: () {
          print("on tap 4");
          Navigator.push(context, MaterialPageRoute(builder: (context) => RandomPasswordScreen()));
        });
    List<Items> myList = [item1, item2, item3, item4];
    var color = 0xff453658;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return GestureDetector(
              onTap: data.onTap,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(color), borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 42,
                      height: 42,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.asset(
                        data.img,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      data.title,
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String img;
  void Function() onTap;

  Items({required this.title, required this.img, required this.onTap});
}
