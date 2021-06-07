part of 'pages.dart';

class Dashboard extends StatefulWidget {
  final Users users;
  Dashboard({this.users});
  @override
  _DashboardState createState() => _DashboardState();
}

String date = DateFormat.yMMMd().format(DateTime.now());
String checkDate = DateFormat('d-MM-yyyy').format(DateTime.now());

class _DashboardState extends State<Dashboard> {
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  CollectionReference productCollection =
      FirebaseFirestore.instance.collection("products");
  String currentUsername, currentBalance;

      

  Widget buildBody() {
    return Container(
        height: 300,
        padding: EdgeInsets.only(top: 10),
        child: StreamBuilder<QuerySnapshot>(
          stream: productCollection.where('productDate', isEqualTo: checkDate)
      .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Failed to load data!");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return ActivityServices.loadings();
            }
            return new ListView(
              children: snapshot.data.docs.map((DocumentSnapshot doc) {
                Products products;
                if (doc.data()['addBy'] ==
                    FirebaseAuth.instance.currentUser.uid) {
                  products = new Products(
                    doc.data()['productId'],
                    doc.data()['productName'],
                    doc.data()['productBrand'],
                    doc.data()['productDate'],
                    doc.data()['productType'],
                    doc.data()['productCondition'],
                    doc.data()['productDesc'],
                    doc.data()['productPrice'],
                    doc.data()['productImage'],
                    doc.data()['addBy'],
                    doc.data()['createdAt'],
                    doc.data()['updatedAt'],
                  );
                } else {
                  products = null;
                }
                return ReminderCard(products: products);
              }).toList(),
            );
          },
        ));
  }

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
                          child: FutureBuilder(
                            future: _username(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              return Text(
                                'Welcome, $currentUsername',
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Color(0xFF8ad5aa),
                                    fontFamily: 'Nexa'),
                              );
                            },
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
                                        child: FutureBuilder(
                                          future: _balance(),
                                          builder: (BuildContext context,
                                              AsyncSnapshot snapshot) {
                                            return Text(
                                                'IDR' + ('$currentBalance'),
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ));
                                          },
                                        ),
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
                        buildBody(),
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  _username() async {
    // ignore: await_only_futures
    final myuser = await FirebaseAuth.instance.currentUser.uid;
    if (myuser != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(myuser)
          .get()
          .then((ds) {
        currentUsername = ds.data()['name'];
        print("username" + currentUsername);
      });
    }
  }

  _balance() async {
    // ignore: await_only_futures
    final myuser = await FirebaseAuth.instance.currentUser.uid;
    if (myuser != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(myuser)
          .get()
          .then((ds) {
        currentBalance = ds.data()['balance'];
      });
    }
  }
}
