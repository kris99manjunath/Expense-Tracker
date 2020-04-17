import 'package:flutter/material.dart';

import './widgets//listView.dart';
import './widgets/models/transactions.dart';
import './widgets/addTrans.dart';

void main() {
  runApp(MyHome());
}

class MyHome extends StatelessWidget {
  const MyHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(home: MyApp(),
        theme: ThemeData(
          primarySwatch: Colors.amber,
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          primaryColor: Colors.cyanAccent,
          brightness: Brightness.dark,
          accentColor: Colors.cyanAccent,
          
        ),
        
        title: 'Expense Tracker'
    ));
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transaction> trans = [
    Transaction(
        title: "First transaction", amount: 200, date: DateTime.now(), id: 0),
    Transaction(
        title: "Eating pani puri outside",
        amount: -88.90,
        date: DateTime.now(),
        id: 1)
  ];
  bool flag = false;

  void openModal(BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (_) => AddTrans(add));
  }

  void add({@required String title, DateTime date, @required double amount}) {
    
    Transaction tx =
        Transaction(amount: amount, date: date, title: title, id: trans.length);
    setState(() {
      trans.add(tx);
      flag = !flag;
    });
    print('added');
    print(trans.length);
    
  }

  void remove(@required int id) {
    setState(() {
      trans.removeWhere((tx) {
        return tx.id == id;
      });
    });
    //print(trans.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Expense tracker'),
        ),
        body: (flag)
            ? AddTrans(add)
            : SingleChildScrollView(child: TransactionView(trans, remove)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () => openModal(context),
          child: Icon(
            (!flag) ? Icons.add : Icons.close,
          ),
          
          //backgroundColor: (!flag) ? Colors.blue : Colors.red,
        ));
  }
}
