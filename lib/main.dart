import 'package:flutter/material.dart';
import 'package:p5/p5.dart';
import 'sketches/demo.sketch.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Creative Coding'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  MySketch sketch;
  PAnimator animator;

  @override
  void initState() {
    super.initState();
    sketch = new MySketch();
    // Need an animator to call the draw() method in the sketch continuously,
    // otherwise it will be called only when touch events are detected.
    animator = new PAnimator(this);
    animator.addListener(() {
      setState(() {
        sketch.redraw();
      });
    });
    animator.run();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text(widget.title)),
      backgroundColor: const Color.fromRGBO(200, 200, 200, 1.0),
      body: new Center(
        child: new PWidget(sketch),
      ),
    );
  }
}
