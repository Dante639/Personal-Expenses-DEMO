import 'package:flutter/material.dart';
import 'package:first_app/TransactionList.dart';
import 'package:first_app/NEWtrAnsaCTion.dart';
import 'package:first_app/Transaction.dart';
import 'package:first_app/Chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  @deprecated
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses DEMO',
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColorDark: Colors.black,
        primaryColorLight: Colors.purple,
        backgroundColor: Colors.black87,
        scaffoldBackgroundColor: Colors.black26,
        unselectedWidgetColor: Colors.redAccent,
        secondaryHeaderColor: Colors.red,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.dark().textTheme.copyWith(
              titleLarge: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontSize: 25,
              ),
            ),
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Transaction> userTransaction = [
    //   Transaction(
    //       total: 99.9, date: DateTime.now(), id: 'New 1', tilte: 'New Shoes'),
    //   Transaction(
    //       total: 69.9,
    //       date: DateTime.now(),
    //       id: 'New 2',
    //       tilte: 'Weekly Glorious'),
  ];

  void startADDnewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (just) {
        return GestureDetector(
          child: NEWtrAnsaCTion(addTrAnSACtiOn),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  List<Transaction> get recentTransaction  {
    return userTransaction.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)
      )
      );
    }).toList();
  }

  void addTrAnSACtiOn(String aTtitle, double aTtotal,DateTime chosenDate) {
    final newat = Transaction(
        total: aTtotal,
        date: chosenDate,
        id: DateTime.now().toString(),
        tilte: aTtitle);

    setState(() {
      userTransaction.add(newat);
    });
  }

  void deleteTransaction(String id) {
   setState(() {
     userTransaction.removeWhere((ele) {
       return ele.id==id;
     });
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text(
          'Personal Expenses ',
          //Its so long write better use FONTS  style: TextStyle (color: Colors.purple,fontWeight: FontWeight.w700,fontSize: 23,wordSpacing:5,fontStyle: FontStyle.italic)
          style: TextStyle(
              fontFamily: 'Open Sans',
              fontSize: 20,
              color: Colors.purple,
              fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: () => startADDnewTransaction(context),
            icon: Icon(
              Icons.add,
              color: Colors.purple,
              size: 28.3,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Chart(recentTransaction),
            transactionList(userTransaction,deleteTransaction)],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => startADDnewTransaction(context),
        child: Icon(
          Icons.add,
          color: Colors.black,
          size: 30.5,
        ),
        focusColor: Colors.purple,
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
