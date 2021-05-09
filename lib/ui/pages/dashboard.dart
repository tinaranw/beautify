part of 'pages.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

 String date = DateFormat.yMMMd().format(DateTime.now());

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        automaticallyImplyLeading: false,
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(24),
        child: Stack(
          children: [
            ListView(
              children: [
                Column(
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
                                    onPressed: () => {},
                                    icon: Icon(Icons.add),
                                  )),
                                  Expanded(
                                      child: IconButton(
                                    onPressed: () => {},
                                    icon: Icon(Icons.call_made),
                                  )),
                                  Expanded(
                                      child: IconButton(
                                    onPressed: () => {},
                                    icon: Icon(Icons.list),
                                  )),
                                  Expanded(
                                      child: IconButton(
                                    onPressed: () => {},
                                    icon: Icon(Icons.calendar_today),
                                  )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
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
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}