import 'package:flutter/material.dart';
import 'package:fnbc_app_new/src/transfer_money_screen.dart';

void main(){
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TransferMoneyScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}