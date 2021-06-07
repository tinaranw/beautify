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
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Color(0xFF99E4F9),
          child: Stack(
            children: [
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: Padding(
                    padding: EdgeInsets.all(0),
                    child: Container(
                      width: double.infinity,
                      height: 480,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: ListView(
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
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
                                                  fontSize: 24,
                                                  fontFamily: 'Nexa',
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff564B46)),
                                              textAlign: TextAlign.left);
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        // print((product.productType).toString()),
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(12, 4, 12, 4),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFB7E5E3),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: StreamBuilder<QuerySnapshot>(
                                            stream:
                                                productCollection.snapshots(),
                                            builder: (BuildContext context,
                                                AsyncSnapshot<QuerySnapshot>
                                                    snapshot) {
                                              if (snapshot.hasError) {
                                                return Text(
                                                    "Failed to load data!");
                                              }
                                              switch (
                                                  snapshot.connectionState) {
                                                case ConnectionState.waiting:
                                                  return ActivityServices
                                                      .loadings();
                                                default:
                                                  return new Text(
                                                      product.productType,
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontFamily: 'Nexa',
                                                        color:
                                                            Color(0xff564B46),
                                                      ));
                                              }
                                            },
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(12, 4, 12, 4),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFC8A6CB),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: StreamBuilder<QuerySnapshot>(
                                            stream:
                                                productCollection.snapshots(),
                                            builder: (BuildContext context,
                                                AsyncSnapshot<QuerySnapshot>
                                                    snapshot) {
                                              if (snapshot.hasError) {
                                                return Text(
                                                    "Failed to load data!");
                                              }
                                              switch (
                                                  snapshot.connectionState) {
                                                case ConnectionState.waiting:
                                                  return ActivityServices
                                                      .loadings();
                                                default:
                                                  return new Text(
                                                      product.productCondition,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontFamily: 'Nexa',
                                                          color:
                                                              Color(0xff564B46),
                                                          backgroundColor:
                                                              Color(
                                                                  0xFFC8A6CB)));
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    StreamBuilder<QuerySnapshot>(
                                      stream: productCollection.snapshots(),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<QuerySnapshot>
                                              snapshot) {
                                        if (snapshot.hasError) {
                                          return Text("Failed to load data!");
                                        }
                                        switch (snapshot.connectionState) {
                                          case ConnectionState.waiting:
                                            return ActivityServices.loadings();
                                          default:
                                            return new Text(
                                                product.productPrice,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'Nexa',
                                                  color: Color(0xFFDE5E52),
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
                                    'General Info',
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
                                Row(
                                  children: [
                                    Expanded(
                                      child: StreamBuilder<QuerySnapshot>(
                                        stream: productCollection.snapshots(),
                                        builder: (BuildContext context,
                                            AsyncSnapshot<QuerySnapshot>
                                                snapshot) {
                                          if (snapshot.hasError) {
                                            return Text("Failed to load data!");
                                          }
                                          switch (snapshot.connectionState) {
                                            case ConnectionState.waiting:
                                              return ActivityServices
                                                  .loadings();
                                            default:
                                              return new RichText(
                                                text: TextSpan(
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2,
                                                  children: [
                                                    WidgetSpan(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    2.0),
                                                        child: Icon(
                                                            Icons.bookmark),
                                                      ),
                                                    ),
                                                    TextSpan(
                                                        text: product
                                                            .productBrand),
                                                  ],
                                                ),
                                              );
                                          }
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: StreamBuilder<QuerySnapshot>(
                                        stream: productCollection.snapshots(),
                                        builder: (BuildContext context,
                                            AsyncSnapshot<QuerySnapshot>
                                                snapshot) {
                                          if (snapshot.hasError) {
                                            return Text("Failed to load data!");
                                          }
                                          switch (snapshot.connectionState) {
                                            case ConnectionState.waiting:
                                              return ActivityServices
                                                  .loadings();
                                            default:
                                              return new RichText(
                                                text: TextSpan(
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2,
                                                  children: [
                                                    WidgetSpan(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    2.0),
                                                        child: Icon(
                                                            Icons.lock_clock),
                                                      ),
                                                    ),
                                                    TextSpan(
                                                        text: product
                                                            .productDate),
                                                  ],
                                                ),
                                              );
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
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
                        ],
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80, right: 30),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 200.0,
                    width: 200.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(product.productImage)),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: new Icon(Icons.delete, color: Colors.white),
          backgroundColor: Color(0xFFDE5E52),
        ));
  }
}
