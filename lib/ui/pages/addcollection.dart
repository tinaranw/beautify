part of 'pages.dart';

class AddCollection extends StatefulWidget {
  @override
  _AddCollectionState createState() => _AddCollectionState();
}

class _AddCollectionState extends State<AddCollection> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text("Add Collection"),
      ),
    );
  }
}