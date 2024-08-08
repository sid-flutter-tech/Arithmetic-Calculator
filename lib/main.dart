import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Radio Button Example';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
        title: 'lool',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController no1controller = TextEditingController();
  TextEditingController no2controller = TextEditingController();
  int results = 0;
  int operation = -1;
  int Resultshow = 0;

  TextStyle style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 22,
  );
  Color _colors = Colors.orange;

  int selectedIndex = -1;
  List<Map<String, dynamic>> mOperator = [
    {"title": "+", "color": Colors.orange},
    {"title": "-", "color": Colors.orange},
    {"title": "*", "color": Colors.orange},
    {"title": "/", "color": Colors.orange}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _colors,
        title: Center(
          child: Text(
            'Arithmetic Calculator',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
        toolbarHeight: 70,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: no1controller,
                style: style,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text('Enter the 1st number : '),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.indigo,
                      style: BorderStyle.solid,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.indigoAccent,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: no2controller,
                style: style,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text('Enter the 2nd number : '),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.indigo,
                      style: BorderStyle.solid,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.indigoAccent,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: mOperator.length,
                  itemBuilder: (_, Index) {
                    return InkWell(
                      onTap: () {
                          if (no1controller.text.isEmpty ||
                          no2controller.text.isEmpty) {
                            setState(() {
                              Resultshow = 1;
                            });

                          } else {
                            setState(() {
                              selectedIndex = Index;
                            });
                          }
                      },
                      child: Container(
                        width: 58,
                        margin: EdgeInsets.only(left: 13, right: 13),
                        height: 58,
                        decoration: BoxDecoration(
                          color: selectedIndex == Index
                              ? Colors.green
                              : mOperator[Index]['color'],
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            mOperator[Index]['title'],
                            style: TextStyle(fontSize: 35, color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        operation = selectedIndex;
                        if (no1controller.text.isEmpty ||
                            no2controller.text.isEmpty) {
                          Resultshow = 1;
                        } else {
                          if (operation == -1) {
                            Resultshow = 2;
                          } else {
                            int no1 = int.parse(no1controller.text);
                            int no2 = int.parse(no2controller.text);
                            switch (operation) {
                              case 0:
                                results = no1 + no2;
                                break;
                              case 1:
                                results = no1 - no2;
                                break;
                              case 2:
                                results = no1 * no2;
                                break;
                              case 3:
                                results = no1 ~/ no2;
                                break;
                            }
                            Resultshow = 4;
                          }
                        }
                      });
                    },
                    child: Text(
                      'Result',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        no1controller.clear();
                        no2controller.clear();
                        Resultshow = 0;
                        operation = -1;
                        selectedIndex = -1; // Reset the selected index
                      });
                    },
                    child: Text(
                      'RESET',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Resultshow == 0 ? Container() : Resultshow == 1 ? Text("Please enter values in both textFields")
                  : Resultshow == 2
                  ? Text("Please select any operation to perform")
                  : Text("The calculated value is  $results"),
            ],
          ),
        ),
      ),
    );
  }
}
