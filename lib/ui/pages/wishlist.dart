part of 'pages.dart';

class Wishlist extends StatefulWidget {
  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  bool isLoading = false;
  String uid = FirebaseAuth.instance.currentUser.uid;
  CollectionReference productCollection =
      FirebaseFirestore.instance.collection("products");

  Widget buildBody() {
    return Container(
        height: 470,
        padding: EdgeInsets.all(12),
        child: StreamBuilder<QuerySnapshot>(
          stream: productCollection.snapshots(),
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
                return ProductCardBudget(products: products);
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
