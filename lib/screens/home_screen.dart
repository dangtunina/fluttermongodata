import 'package:flutter/material.dart';
import 'package:fluttermongodata/utils/helper/mongodb/dbconnection.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap:(){
              print("run");
              _connectDB();
              print("dddd");
            },
            child:Center(
              child:Text("ConnectData"),
            ),
          ),
          const SizedBox(height:50,),
          GestureDetector(
            onTap:(){
              _closeConnected();
            },
            child:Text("Close connect"),
          ),
          const SizedBox(height:50,),
          GestureDetector(
            onTap:(){
              _getUserList();
            },
            child:Text("Get user"),
          ),
          const SizedBox(height:50,),
          GestureDetector(
            onTap:(){
              _getdataList();
            },
            child:Text("Get datas"),
          )


        ],
      )
    );
  }




  void _connectDB(){
    ninavn_dbconnection.connect(context);

  }

  void _closeConnected(){
    ninavn_dbconnection db=ninavn_dbconnection();

  }

  void _getUserList(){

    ninavn_dbconnection db=ninavn_dbconnection();
    print("add code");

  }

  void _getdataList()async{

   var datauser= await ninavn_dbconnection.getDocuments();
   print(datauser);
  }

}

