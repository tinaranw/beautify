part of 'widgets.dart';

class WishlistCard extends StatefulWidget {
  final Wishlists wishlists;
  WishlistCard({this.wishlists});

  @override
  _WishlistCardtState createState() => _WishlistCardtState();
}

class _WishlistCardtState extends State<WishlistCard> {
  String addToCart = '0';
  double total = 0;
  double totalNow = 0;
  @override
  Widget build(BuildContext context) {
    Wishlists wishlist = widget.wishlists;
    if (wishlist == null) {
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
              backgroundImage: NetworkImage(wishlist.wishlistImage),
            ),
            title: Text(
              wishlist.wishlistName,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              maxLines: 1,
              softWrap: true,
            ),
            subtitle: Text(
              wishlist.wishlistPrice + " (" + (wishlist.wishlistTotal) + ")",
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
                    wishlist.wishlistChecked == '0'
                        ? CupertinoIcons.rectangle
                        : CupertinoIcons.checkmark_rectangle,
                    color: Colors.orangeAccent,
                  ),
                  onPressed: () {
                    setState(() {
                      if (wishlist.wishlistChecked == '0') {
                        addToCart = '1';
                      } else {
                        addToCart = '0';
                      }
                      WishlistServices.updateCart(
                          wishlist.wishlistId, addToCart);
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
