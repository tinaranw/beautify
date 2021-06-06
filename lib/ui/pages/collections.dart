part of 'pages.dart';

class Collections extends StatefulWidget {
  @override
  _CollectionsState createState() => _CollectionsState();
}

class _CollectionsState extends State<Collections> {
  String uid = FirebaseAuth.instance.currentUser.uid;
  CollectionReference productCollection =
      FirebaseFirestore.instance.collection("products");

  Widget buildBody() {
    return Container(
      height: 300,
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
                return ProductCard(products: products);
              }).toList(),
            );
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Collections"),
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
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Image.asset("assets/images/paletteicon.png",
                              height: 210),
                          SizedBox(width: 8),
                          Column(
                            children: [
                              Image.asset(
                                "assets/images/brushicon.png",
                                height: 100,
                              ),
                              SizedBox(height: 8),
                              Image.asset(
                                "assets/images/foundationicon.png",
                                height: 100,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 24),
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          'All Collected Products',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              color: Color(0xFF636263),
                              fontFamily: 'Nexa'),
                        ),
                      ),
                    ),
                    buildBody(),
                  ],
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, AddProduct.routeName);
        },
        child: new Icon(Icons.add, color: Colors.white),
        backgroundColor: Color(0xFF34495E),
      ),
    );
  }
}
