part of 'pages.dart';



class MainMenu extends StatefulWidget {
  static const String routeName = "/mainmenu";
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    Collections(),
    Wishlist(),
    Profile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    localNotifyManager.setOnNotificationReceive(onNotificationReceive);
    localNotifyManager.setOnNotificationClick(onNotificationClick);

  }

  onNotificationReceive(ReceiveNotification notification){
    print('Notification Received: ${notification.id}');
  }

  onNotificationClick(String payload){
    print('Payload $payload');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Dashboard'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Collections'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: 'Wishlist'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 0,
        backgroundColor: Color(0xFFf19b8e),
        selectedItemColor: Color(0xFF34495e),
        unselectedItemColor: Color(0xFFf9e2e8),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
  
}
