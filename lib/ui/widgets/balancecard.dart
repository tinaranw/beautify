part of 'widgets.dart';

//imported google's material design library
class BalanceCard extends StatefulWidget {
  final Users users;
  BalanceCard({this.users});
  @override
  _BalanceCardState createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  Users users;
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  String currentBalance;
  String currentUID = FirebaseAuth.instance.currentUser.uid;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 170,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Color(0xFFFFF5EE),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Color(0xFFF6C9A8),
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
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        return Text('IDR' + ('$currentBalance'),
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
            Container(
              height: 60,
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                      child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, EditBalance.routeName,
                          arguments: currentUID);
                    },
                    icon: Icon(Icons.edit),
                  )),
                  Expanded(
                      child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Statistics.routeName);
                    },
                    icon: Icon(Icons.call_made),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
