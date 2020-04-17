import 'package:flutter/material.dart';

class Income extends StatefulWidget {
  bool income = false;
  final toggle;
  Income(this.toggle);

  @override
  _IncomeState createState() => _IncomeState();
}

class _IncomeState extends State<Income> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Container(child: Switch(value: widget.income,onChanged: (val){
         widget.toggle();
         setState(() {
          widget.income = val;  
         });
         
       },),),
    );
  }
}

class AddTrans extends StatefulWidget {
  final add;
  AddTrans(this.add);

  @override
  _AddTransState createState() => _AddTransState();
}

class _AddTransState extends State<AddTrans> {
  final title = TextEditingController();

  final date = TextEditingController();

  final amount = TextEditingController();

  bool income = false;

  void toggle()
  {
    income = !income;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      child: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.all(5),
              child: Card(
                child: TextField(
                  decoration: InputDecoration(labelText: 'Title'),
                  controller: title,
                ),
                elevation: 10,
              )),

          Container(
            margin: EdgeInsets.all(5),
            child: Card(
              elevation: 10,
              child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround, 
                     children: <Widget>[
                  Container(child: Text('Income:')),
                  Income(toggle),
                  Container(
                        width: 150,
                        child: TextField(
                          decoration: InputDecoration(labelText: 'Amount'),
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          controller: amount,
                        ),
                      ),
                ],
              ),
            ),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.all(5),
            child: Card(
              elevation: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('No Date Chosen'),
                  FlatButton(
                    child: Text(
                      'Choose date',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    onPressed: () {
                      showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: null,
                          lastDate: DateTime.now());
                    },
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: RaisedButton(
              onPressed: (){
                Navigator.pop(context);
                widget.add(
                  title: title.text,
                  date: DateTime.now(),
                  amount: double.parse(amount.text));
                  },
              child: Text(
                'Add transaction',
                style:
                    TextStyle(color: Theme.of(context).accentIconTheme.color),
              ),
              color: Theme.of(context).accentColor,
            ),
          ),
          Container(
              margin: EdgeInsets.all(65),
              child: FloatingActionButton(
            child: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ))
        ],
      ),
    );
  }
}
