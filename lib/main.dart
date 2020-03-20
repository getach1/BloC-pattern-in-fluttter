import 'package:enhancingcounter/counter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(), child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = context.bloc<CounterBloc>();
    return Scaffold(
      appBar: AppBar(
//        title: Text(widget.title),
          ),
      body: BlocBuilder<CounterBloc, int>(builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                "$state",
                style: Theme.of(context).textTheme.display1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  buildRaisedButton(Colors.red, () {
                    counterBloc.add(CounterEvent.increment);
                  }, Icons.remove),
                  buildRaisedButton(Colors.green, () {
                    counterBloc.add(CounterEvent.decrement);
                  }, Icons.add),
                ],
              ),
            ],
          ),
        );
      }),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CounterEvent.reset;
        },
        tooltip: 'Increment',
        child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  RaisedButton buildRaisedButton(Color color, onTap, icon) {
    return RaisedButton(
      color: color,
      elevation: 10.0,
      onPressed: onTap,
      splashColor: Colors.amber,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
