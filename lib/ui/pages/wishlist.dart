part of 'pages.dart';

class Wishlist extends StatefulWidget {
  final Users users;
  Wishlist({this.users});
  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  bool isLoading = false;
  String uid = FirebaseAuth.instance.currentUser.uid;
  CollectionReference wishlistCollection =
      FirebaseFirestore.instance.collection("wishlist");
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  String currentBudget;
  int totalExpense = 0;
  int total = 0;

  void getTotal() {
    print("checktotal");
    WishlistServices.getTotalExpense(uid).then((value) {
      setState(() {
        print(value);
        totalExpense = value;
        print("totalExpense: " + (totalExpense).toString());
         
      });
    });
   
  }

  Widget buildBody() {
    return Container(
        height: 410,
        padding: EdgeInsets.all(12),
        child: StreamBuilder<QuerySnapshot>(
          stream: wishlistCollection.snapshots(),
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
                Wishlists wishlists;
                if (doc.data()['addBy'] ==
                    FirebaseAuth.instance.currentUser.uid) {
                  wishlists = new Wishlists(
                    doc.data()['wishlistId'],
                    doc.data()['wishlistName'],
                    doc.data()['wishlistBrand'],
                    doc.data()['wishlistType'],
                    doc.data()['wishlistPrice'],
                    doc.data()['wishlistTotal'],
                    doc.data()['wishlistImage'],
                    doc.data()['wishlistChecked'],
                    doc.data()['addBy'],
                    doc.data()['createdAt'],
                    doc.data()['updatedAt'],
                  );
                } else {
                  wishlists = null;
                }
                return WishlistCard(wishlists: wishlists);
              }).toList(),
            );
          },
        ));
  }

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
                    buildBody(),
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
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, AddWishlist.routeName);
                              },
                              icon: Icon(Icons.add),
                              label: Text("Add to cart"),
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF74D6D7),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(30.0)))),
                        ),
                      ),
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
                          FutureBuilder(
                            future: _budget(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              return Text(
                                'IDR ' + '$currentBudget',
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Nexa',
                                    color: Color(0xFF636263)),
                              );
                            },
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
                          Expanded(
                            child: Text(
                              'Total',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Nexa',
                                  color: Color(0x59636263)),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'IDR ' + ('$totalExpense').toString(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Nexa',
                                  color: Color(0xFF636263)),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.refresh),
                            color: Color(0xFF636263),
                            onPressed: () {
                              getTotal();
                            },
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

  _budget() async {
    // ignore: await_only_futures
    final myuser = await FirebaseAuth.instance.currentUser.uid;
    if (myuser != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(myuser)
          .get()
          .then((ds) {
        currentBudget = ds.data()['balance'];
        print("budget" + currentBudget);
      });
    }
  }
}
