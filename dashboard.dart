import 'package:flutter/material.dart';

final List<String> titles = [
  "FOR YOU",
  "NEW ARRIVALS",
  "WOMEN",
  "MEN",
  "KIDS",
  "MATCHING SETS"
];

final List<IconData> icons = [
  Icons.star,
  Icons.new_releases,
  Icons.pregnant_woman,
  Icons.male,
  Icons.child_care,
  Icons.group_add
];


const Color backgroundTop = Color(0xFFFFF1EA);       
const Color backgroundBottom = Color(0xFFFADBD0);   
const Color softGold = Color(0xFFCBA135);            
const Color roseBlush = Color(0xFFEAC4B3);           
const Color textDark = Color(0xFF3E3E3E);            
const Color glassTile = Color(0x66FFFFFF);          
const Color tileBorder = Color(0x33FFFFFF);         

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [backgroundTop, backgroundBottom],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite, color: softGold, size: 24),
                    SizedBox(width: 8),
                    Text(
                      'Deone Fashion',
                      style: TextStyle(
                        color: softGold,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Text(
                  'DEONE FASHION',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: textDark,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(height: 24),
                Expanded(
                  child: GridView.builder(
                    itemCount: titles.length,
                    padding: EdgeInsets.only(bottom: 16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: glassTile,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: tileBorder),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 12,
                              spreadRadius: 2,
                              offset: Offset(4, 6),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              icons[index],
                              color: softGold,
                              size: 34,
                            ),
                            SizedBox(height: 12),
                            Text(
                              titles[index],
                              style: TextStyle(
                                color: textDark,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                letterSpacing: 0.5,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
