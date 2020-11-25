import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_bloc_pattern/bloc/CounterBloc.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
              icon: Icon(Icons.account_tree_rounded),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SecondPage()));
              })
        ],
      ),
      body:
          HomeBody(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _counterBloc = BlocProvider.of<CounterBloc>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BlocBuilder<CounterBloc, int>(
            builder: (BuildContext context, state) {
              return Text(
                'Counter $state',
                style: Theme.of(context).textTheme.headline4,
              );
            },
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                  child: Text('Incrment'),
                  onPressed: () {
                    _counterBloc.add(CounterEvents.increment);
                  }),
              RaisedButton(
                  child: Text('Decrement'),
                  onPressed: () {
                    _counterBloc.add(CounterEvents.decrement);
                  })
            ],
          )
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Text('Counter ${_counterBloc.state}'),
      ),
    );
  }
}
