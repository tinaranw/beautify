part of 'widgets.dart';

class ProductCard extends StatefulWidget {
  final Products products;
  ProductCard({this.products});

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    Products product = widget.products;
    if (product == null) {
      return Container();
    } else {
      return Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        margin: EdgeInsets.fromLTRB(4, 8, 4, 8),
        child: Container(
          padding: EdgeInsets.fromLTRB(4, 12, 4, 12),
          child: ListTile(
            leading: CircleAvatar(
              radius: 24.0,
              backgroundImage: NetworkImage(product.productImage),
            ),
            title: Text(
              product.productName,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              maxLines: 1,
              softWrap: true,
            ),
            subtitle: Text(
              product.productDate,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
              maxLines: 1,
              softWrap: true,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(
                    CupertinoIcons.ellipsis_circle_fill,
                    color: Color(0xFF74D6D7),
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext ctx) {
                          return Container(
                            width: double.infinity,
                            height: 220,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton.icon(
                                      onPressed: () {
                                       Navigator.pushNamed(context, ProductDetail.routeName, arguments: product);
                                      },
                                      icon: Icon(CupertinoIcons.eye_fill),
                                      label: Text("Show Data"),
                                      style: ElevatedButton.styleFrom(
                                          primary: Color(0xFFB7E5E3))),
                                  ElevatedButton.icon(
                                      onPressed: () {
                                        Navigator.pushNamed(context, EditProduct.routeName, arguments: product);
                                      },
                                      icon: Icon(
                                          CupertinoIcons.pencil_circle_fill),
                                      label: Text("Edit Data"),
                                       style: ElevatedButton.styleFrom(
                                          primary: Color(0xFFC8A6CB))),
                                      
                                  ElevatedButton.icon(
                                      onPressed: () async {
                                        bool result =
                                            await ProductServices.deleteProduct(
                                                product.productId);
                                        if (result) {
                                          ActivityServices.showToast(
                                              "Delete Data Success",
                                              Colors.green);
                                        } else {
                                          ActivityServices.showToast(
                                              "Delete Data Success",
                                              Colors.red);
                                        }
                                      },
                                      icon: Icon(
                                          CupertinoIcons.trash_circle_fill),
                                      label: Text("Delete Data"),
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.red))
                                ]),
                          );
                        });
                  },
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
