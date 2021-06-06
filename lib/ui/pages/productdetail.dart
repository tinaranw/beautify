part of 'pages.dart';

class ProductDetail extends StatefulWidget {
  @override
  static const String routeName = "/productdetail";
  final Products product;
  ProductDetail({this.product});
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  CollectionReference productCollection =
      FirebaseFirestore.instance.collection("products");

  @override
  Widget build(BuildContext context) {
    Products product = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text("Product Detail"),
          automaticallyImplyLeading: false,
        ),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(color: Color(0xFFFFF)),
            ),
            Align(
              alignment: FractionalOffset.topCenter,
              child: Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                    color: Color(0xFF99E4F9),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: Align(
                  alignment: FractionalOffset.topCenter,
                  child: Container(
                      margin: EdgeInsets.only(top: 110),
                      // decoration: BoxDecoration(color: Color(0xFF636363)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [],
                      )),
                )),
              ],
            ),
            Container(
                padding: EdgeInsets.all(24),
                child: Expanded(
                  child: SizedBox(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 320),
                          child: Column(
                            children: [
                              StreamBuilder<QuerySnapshot>(
                                stream: productCollection.snapshots(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (snapshot.hasError) {
                                    return Text("Failed to load data!");
                                  }
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.waiting:
                                      return ActivityServices.loadings();
                                    default:
                                      return new Text(product.productName,
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontFamily: 'Nexa',
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff564B46)),
                                          textAlign: TextAlign.left);
                                  }
                                },
                              ),
                              // Text(
                              //   product.productName!=null ? product.productName : 'Product Name',
                              //   textAlign: TextAlign.left,
                              //   style: TextStyle(
                              //       fontWeight: FontWeight.bold,
                              //       fontSize: 22,
                              //       color: Color(0xFF636263),
                              //       fontFamily: 'Nexa'),
                              // ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                // print((product.productType).toString()),
                                Container(
                                  padding: EdgeInsets.fromLTRB(12, 4, 12, 4),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFB7E5E3),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: StreamBuilder<QuerySnapshot>(
                                    stream: productCollection.snapshots(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<QuerySnapshot> snapshot) {
                                      if (snapshot.hasError) {
                                        return Text("Failed to load data!");
                                      }
                                      switch (snapshot.connectionState) {
                                        case ConnectionState.waiting:
                                          return ActivityServices.loadings();
                                        default:
                                          return new Text(product.productName,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Nexa',
                                                color: Color(0xff564B46),
                                              ));
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(width: 20),
                                Container(
                                  padding: EdgeInsets.fromLTRB(12, 4, 12, 4),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFC8A6CB),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: StreamBuilder<QuerySnapshot>(
                                    stream: productCollection.snapshots(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<QuerySnapshot> snapshot) {
                                      if (snapshot.hasError) {
                                        return Text("Failed to load data!");
                                      }
                                      switch (snapshot.connectionState) {
                                        case ConnectionState.waiting:
                                          return ActivityServices.loadings();
                                        default:
                                          return new Text(product.productName,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'Nexa',
                                                  color: Color(0xff564B46),
                                                  backgroundColor:
                                                      Color(0xFFC8A6CB)));
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            StreamBuilder<QuerySnapshot>(
                              stream: productCollection.snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return Text("Failed to load data!");
                                }
                                switch (snapshot.connectionState) {
                                  case ConnectionState.waiting:
                                    return ActivityServices.loadings();
                                  default:
                                    return new Text(
                                        ActivityServices.toIDR(
                                            product.productPrice),
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Nexa',
                                          color: Color(0xff564B46),
                                        ));
                                }
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
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Description',
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color(0xFF636363),
                                fontFamily: 'Nexa'),
                          ),
                        ),
                        SizedBox(height: 10),
                        StreamBuilder<QuerySnapshot>(
                          stream: productCollection.snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return Text("Failed to load data!");
                            }
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return ActivityServices.loadings();
                              default:
                                return new Text(product.productBrand,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Nexa',
                                      color: Color(0xFF636363),
                                    ));
                            }
                          },
                        ),
                        SizedBox(height: 10),
                        StreamBuilder<QuerySnapshot>(
                          stream: productCollection.snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return Text("Failed to load data!");
                            }
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return ActivityServices.loadings();
                              default:
                                return new Text(product.productDesc,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Nexa',
                                      color: Color(0xff564B46),
                                    ));
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: new Icon(Icons.delete, color: Colors.white),
          backgroundColor: Color(0xFFDE5E52),
        ));
  }
}
