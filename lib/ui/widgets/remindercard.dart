part of 'widgets.dart';

class ReminderCard extends StatefulWidget {
  final Products products;
  ReminderCard({this.products});

  @override
  _ReminderCardState createState() => _ReminderCardState();
}

class _ReminderCardState extends State<ReminderCard> {
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
                    CupertinoIcons.exclamationmark_circle_fill,
                    color: Color(0xFFDE5E52),
                  ),
                  onPressed: () {
                    
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
