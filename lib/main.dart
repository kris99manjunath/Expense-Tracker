import 'package:flutter/material.dart';

import './widgets//listView.dart';
import './widgets/models/transactions.dart';
import './widgets/addTrans.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transaction> trans = [Transaction(title: "First transaction", amount: 200, date: DateTime.now(),id:0),
    Transaction(title: "Eating pani puri outside", amount: -88.90, date: DateTime.now(),id:1)];
    bool flag = false;
  
  void add({@required String title, DateTime date, @required double amount}) {
    Transaction tx = Transaction(amount: amount, date: date, title: title, id: trans.length);
    trans.add(tx);
  }

  void remove(@required int id) {
    
    setState(() {  
      trans.removeWhere((tx){
       return tx.id == id; 
      });
    });
    //print(trans.length);
  }
  @override
  Widget build(BuildContext context) {
        return MaterialApp(
        title: 'Flutter Demo',
        darkTheme: ThemeData(),
        home: Scaffold(
            appBar: AppBar(
              title: Text('Expense tracker'),
            ),
            body: (flag)?AddTrans():SingleChildScrollView(child: TransactionView(trans,remove)),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

            floatingActionButton: FloatingActionButton(onPressed: (){
              setState(() {
                flag = !flag;
              });
            },child: Icon((!flag)?Icons.add:Icons.close,),backgroundColor: (!flag)?Colors.blue:Colors.red,)));
  }
}
