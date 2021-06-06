part of 'widgets.dart';

class ProductCardBudget extends StatefulWidget {
  final Products products;
  ProductCardBudget({this.products});

  @override
  _ProductCardBudgetState createState() => _ProductCardBudgetState();
}

class _ProductCardBudgetState extends State<ProductCardBudget> {
  bool addToCart = false;
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
              ActivityServices.toIDR(product.productPrice),
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
                  addToCart == false ? CupertinoIcons.rectangle: CupertinoIcons.checkmark_rectangle,
                    color: Colors.orangeAccent,
                  ),
                  onPressed: () {
                    setState(() {
                      if(!addToCart){
                        addToCart = true;
                      } else {
                        addToCart = false;
                      }
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