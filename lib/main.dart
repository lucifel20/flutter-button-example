import 'package:flutter/material.dart';

void main() => runApp(ButtonExample());

class ButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    const String APP_TITLE = 'Flutter Button Example';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_TITLE,
      home: HomeRoute(),
    ); // MaterialApp()
  }
}

class HomeRoute extends StatefulWidget {
  @override
  _HomeRoute createState() => _HomeRoute();
}

class _HomeRoute extends State<HomeRoute> {
  //
  String _text = '';

  String _dropdownMenuItemValue = '0';
  List<DropdownMenuItem> _dropdownMenuItems = <DropdownMenuItem>[
    DropdownMenuItem(
      value: '0',
      child: Text('_'),
    ),
    DropdownMenuItem(
      value: '1',
      child: Text('Item 1'),
    ),
    DropdownMenuItem(
      value: '2',
      child: Text('Item 2'),
    ),
    DropdownMenuItem(
      value: '3',
      child: Text('Item 3'),
    ),
  ];

  void _flatButtonPressed() {
    setState(() => _text = 'Flat Button is Pressed');
  }

  void _outlineButtonPressed() {
    setState(() => _text = 'Outline Button is Pressed');
  }

  void _raisedButtonPressed() {
    setState(() => _text = 'Raised Button is Pressed');
  }

  void _iconButtonPressed() {
    setState(() => _text = 'Icon Button is Pressed');
  }

  void _floatingActionButtonPressed() {
    setState(() => _text = 'Floating Action Button is Pressed');
  }

  void _dropdownMenuItemChanged(dynamic value) {
    setState(() {
      _dropdownMenuItemValue = value;
      if (value != '0')
        _text = 'Dropdown Menu Item $value is Selected';
      else
        _text = '';
    });
  }

  List<PopupMenuEntry> _popupMenuItemBuilder(BuildContext context) {
    return <PopupMenuEntry>[
      PopupMenuItem(
        value: 1,
        child: Text('Item 1'),
      ),
      PopupMenuItem(
        value: 2,
        child: Text('Item 2'),
      ),
      PopupMenuItem(
        value: 3,
        child: Text('Item 3'),
      ),
    ];
  }

  void _popupMenuItemSelected(dynamic value) {
    setState(() => _text = 'Popup Menu Item $value is Selected');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.indigo,
                  width: 1.0,
                ), // Border.all()
              ), // BoxDecoration()
              child: Text(
                _text,
                textAlign: TextAlign.center,
              ), // Text()
            ), // Container()
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text('Flat Button'),
                  textColor: Colors.black,
                  onPressed: _flatButtonPressed,
                ), // FlatButton()
                OutlineButton(
                  child: Text('Outline Button'),
                  textColor: Colors.red,
                  borderSide: BorderSide(
                    color: Colors.red,
                  ), // BorderSide()
                  onPressed: _outlineButtonPressed,
                ), // OutlineButton()
                RaisedButton(
                  child: Text('Raised Button'),
                  textColor: Colors.white,
                  color: Colors.indigoAccent,
                  onPressed: _raisedButtonPressed,
                ), // RaisedButton()
              ], // List<Widget>[]
            ), // ButtonBar()
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.add_a_photo),
                  color: Colors.blueGrey,
                  onPressed: _iconButtonPressed,
                ), //  IconButton()
                DropdownButton(
                  items: _dropdownMenuItems,
                  value: _dropdownMenuItemValue,
                  onChanged: _dropdownMenuItemChanged,
                ), // DropdownButton()
                PopupMenuButton(
                  itemBuilder: _popupMenuItemBuilder,
                  onSelected: _popupMenuItemSelected,
                ), // PopupMenuButton()
              ], // List<Widget>[]
            ), // ButtonBar()
          ], // List<Widget>[]
        ), // Column()
      ), // SafeArea()
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.whatshot),
        backgroundColor: Colors.indigo,
        onPressed: _floatingActionButtonPressed,
      ), // FloatingActionButton()
    ); // Scaffold()
  }
}
