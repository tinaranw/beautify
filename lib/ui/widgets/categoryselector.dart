part of 'widgets.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;
  final List<String> categories = [
    'All',
    'Primer',
    'Foundation',
    'Concealer',
    'Setting Powder',
    'BB Cream',
    'Blush',
    'Contour',
    'Highlighter',
    'Eyeliner',
    'Mascara',
    'Eyeshadow',
    'Eyebrow',
    'Lip',
    'Setting Spray'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.0,
      color: Colors.transparent,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: Text(
                  categories[index],
                  style: TextStyle(
                      color: index == selectedIndex ? Color(0xFF636263) : Color(0x59636263),
                      decoration: index == selectedIndex? TextDecoration.underline : TextDecoration.none,
                      decorationThickness: index == selectedIndex? 4 : 0,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,),
                ),
              ),
            );
          }),
    );
  }
}
