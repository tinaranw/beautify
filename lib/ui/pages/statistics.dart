part of 'pages.dart';

class Statistics extends StatefulWidget {
  static const String routeName = "/statistics";
  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Statistics"),
        automaticallyImplyLeading: false,
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            ListView(
              children: [
                Container(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            '' + date + '',
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color(0xFF636263),
                                fontFamily: 'SF'),
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Welcome, Tinara Nathania',
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Color(0xFF8ad5aa),
                                fontFamily: 'Nexa'),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 150,
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(15),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text("Balance",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontSize: 18,
                                            )),
                                      ),
                                      Expanded(
                                        child: Text("\$450.50",
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              fontSize: 18,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(color: Colors.black),
                                Container(
                                  padding: EdgeInsets.all(15),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: IconButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, AddProduct.routeName);
                                        },
                                        icon: Icon(Icons.add),
                                      )),
                                      Expanded(
                                          child: IconButton(
                                       onPressed: () {
                                          Navigator.pushNamed(
                                              context, Statistics.routeName);
                                        },
                                        icon: Icon(Icons.call_made),
                                      )),
                                      Expanded(
                                          child: IconButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, SummaryPage.routeName);
                                        },
                                        icon: Icon(Icons.list),
                                      )),
                                      Expanded(
                                          child: IconButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, Calendar.routeName);
                                        },
                                        icon: Icon(Icons.calendar_today),
                                      )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 25),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Categories',
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                                color: Color(0xFF636263),
                                fontFamily: 'Nexa'),
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                child: new Image.asset(
                                  "assets/images/brushbutton.png",
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: new Image.asset(
                                  "assets/images/foundationbutton.png",
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: new Image.asset(
                                  "assets/images/palettebutton.png",
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: new Image.asset(
                                  "assets/images/mascarabutton.png",
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 25),
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Reminder',
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 23,
                                color: Color(0xFF636263),
                                fontFamily: 'Nexa'),
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, ProductDetail.routeName);
                                },
                                child: Card(
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  margin: EdgeInsets.fromLTRB(4, 8, 4, 8),
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(4, 12, 4, 12),
                                    child: ListTile(
                                      leading: Image.asset(
                                          "assets/images/mascaraicon.png"),
                                      title: Text(
                                        'Maybelline Sky High Mascara',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                        maxLines: 1,
                                        softWrap: true,
                                      ),
                                      subtitle: Text(
                                        '26 June 2022',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.normal),
                                        maxLines: 1,
                                        softWrap: true,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                margin: EdgeInsets.fromLTRB(4, 8, 4, 8),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(4, 12, 4, 12),
                                  child: ListTile(
                                    leading: Image.asset(
                                        "assets/images/paletteicon.png"),
                                    title: Text(
                                      'Morphe The James Charles Artistry Palette',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                      softWrap: true,
                                    ),
                                    subtitle: Text(
                                      '26 June 2022',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal),
                                      maxLines: 1,
                                      softWrap: true,
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                margin: EdgeInsets.fromLTRB(4, 8, 4, 8),
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(4, 12, 4, 12),
                                  child: ListTile(
                                    leading: Image.asset(
                                        "assets/images/foundationicon.png"),
                                    title: Text(
                                      'Maybelline Fit Me Foundation',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                      softWrap: true,
                                    ),
                                    subtitle: Text(
                                      '26 June 2022',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.normal),
                                      maxLines: 1,
                                      softWrap: true,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}