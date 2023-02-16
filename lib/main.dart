import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Button Neumorphism',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(), //ButtonConvexRounded(),//HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  //const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  bool isPressed = false;
  bool isDarkMode = false;
  List<bool> _selections = List.generate(2, (_)=> false);

  @override
  Widget build(BuildContext context) {
    final bgColor =
        isDarkMode ? const Color(0xFF2E3239) : const Color(0xFFE7ECEF);
    final colorText =
        isDarkMode ? const Color(0xFFE7ECEF) : const Color(0xFF2E3239);

    Offset distance = isPressed ? Offset(10, 10) : Offset(28, 28);
    double blur = isPressed ? 5.0 : 30.0;

    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
          child: //GestureDetector(   //Usar para botões que devem ficar pressionados
              //onTap: () => setState(() => isPressed = !isPressed),
              Column(
        children: [
           SizedBox(
            height: 100,
          ),
          ToggleButtons(
            children: <Widget>[
              Icon(Icons.wb_sunny),
              Icon(Icons.wb_twighlight),
            ],
            isSelected: _selections,
            onPressed: (int index) {
              setState(() {
                _selections[index] = !_selections[index];
              });
              if(index == 0) {
                this.isDarkMode = false;
              } else {
                this.isDarkMode = true;
              }
            },
          ),
          SizedBox(
            height: 220,
          ),
          Listener(
            //Para botões normais de quando o botão é clicado e volta ao normal depois de pressionado
            onPointerUp: (_) => setState(() => isPressed = false),
            onPointerDown: (_) => setState(() => isPressed = true),
            child: AnimatedContainer(
              //Caso seja um card ou outro elemento somente deixar container e aplicar os formator e ajustes necessarios como para um CARD
              width: 200,
              height: 200,
              duration: const Duration(milliseconds: 100),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: bgColor, //Colors.blueAccent
                boxShadow: [
                  BoxShadow(
                    blurRadius: blur,
                    offset: -distance, //aplica negativo no valor
                    color: isDarkMode ? Color(0xFF35393F) : Colors.white,
                    inset: isPressed,
                  ),
                  BoxShadow(
                    blurRadius: blur,
                    offset: distance,
                    color: isDarkMode ? Color(0xFF23262A) : Color(0xFFA7A9AF),
                    inset: isPressed,
                  )
                ],
              ),
              child: Center(
                child: Text(
                  "Testando",
                  style: TextStyle(
                    fontWeight: isPressed ? FontWeight.bold : FontWeight.w700,
                    fontSize: 24,
                    color: isPressed ? Color(0xFFA7A9AF) : colorText,
                  ),
                ),
              ),
              // SizedBox(
              //   height: 200,
              //   width: 200,
              // ),
            ),
          ),
        ],
      )),
    );
  }
}

class ButtonConvexRounded extends StatefulWidget {
  //const ButtonConvexRounded({super.key});

  @override
  State<ButtonConvexRounded> createState() => _ButtonConvexRoundedState();
}

class _ButtonConvexRoundedState extends State<ButtonConvexRounded> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 500.0,
          height: 500.0,
          color: Color(0xff333333),
          alignment: Alignment.center,
          transformAlignment: Alignment.center,
          child: Container(
            color: Color(0xff333333),
            child: Container(
              width: 200,
              height: 200,
              child: Icon(
                Icons.star,
                size: 67,
                color: Colors.amber,
              ),
              decoration: BoxDecoration(
                color: Color(0xff333333),
                borderRadius: BorderRadius.circular(150),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff515151),
                    Color(0xff151515),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff515151),
                    offset: Offset(-20.0, -20.0),
                    blurRadius: 30,
                    spreadRadius: 0.0,
                  ),
                  BoxShadow(
                    color: Color(0xff151515),
                    offset: Offset(20.0, 20.0),
                    blurRadius: 30,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonFlatRounded extends StatefulWidget {
  //const ButtonFlatRounded({super.key});

  @override
  State<ButtonFlatRounded> createState() => _ButtonFlatRoundedState();
}

class _ButtonFlatRoundedState extends State<ButtonFlatRounded> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 500.0,
          height: 500.0,
          color: Color(0xff333333),
          alignment: Alignment.center,
          transformAlignment: Alignment.center,
          child: Container(
            color: Color(0xff333333),
            child: Container(
              width: 200,
              height: 200,
              child: Icon(
                Icons.star,
                size: 67,
                color: Colors.amber,
              ),
              decoration: BoxDecoration(
                color: Color(0xff333333),
                borderRadius: BorderRadius.circular(150),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff333333),
                    Color(0xff333333),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff515151),
                    offset: Offset(-20.0, -20.0),
                    blurRadius: 30,
                    spreadRadius: 0.0,
                  ),
                  BoxShadow(
                    color: Color(0xff151515),
                    offset: Offset(20.0, 20.0),
                    blurRadius: 30,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonConcave extends StatefulWidget {
  //const MyWidget({super.key});

  @override
  State<ButtonConcave> createState() => _ButtonConcaveState();
}

class _ButtonConcaveState extends State<ButtonConcave> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 500.0,
          height: 500.0,
          color: Color(0xff333333),
          alignment: Alignment.center,
          transformAlignment: Alignment.center,
          child: Container(
            color: Color(0xff333333),
            child: Container(
              width: 200,
              height: 200,
              child: Icon(
                Icons.star,
                size: 67,
                color: Colors.amber,
              ),
              decoration: BoxDecoration(
                color: Color(0xff333333),
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff151515),
                    Color(0xff515151),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff515151),
                    offset: Offset(-20.0, -20.0),
                    blurRadius: 40,
                    spreadRadius: 0.0,
                  ),
                  BoxShadow(
                    color: Color(0xff151515),
                    offset: Offset(20.0, 20.0),
                    blurRadius: 40,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
