part of 'pages.dart';

class Wishlist extends StatefulWidget {
  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wishlist"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      child: CupertinoSearchTextField(
                        backgroundColor: Color(0xFFf2f2f2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    CategorySelector(),
                    Container(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Card(
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
                ),
              ],
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Budget',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Nexa',
                                color: Color(0x59636263)),
                          ),
                          Text(
                            '\$450.50',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Nexa',
                                color: Color(0xFF636263)),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      const Divider(
                        height: 20,
                        thickness: 2,
                        indent: 0,
                        endIndent: 0,
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Nexa',
                                color: Color(0x59636263)),
                          ),
                          Text(
                            '\$166.50',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Nexa',
                                color: Color(0xFF636263)),
                          ),
                        ],
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
