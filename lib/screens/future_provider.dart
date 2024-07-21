import 'package:flutter/material.dart';
import 'package:future_stream_provider/practice/screens/f_practice.dart';
import 'package:future_stream_provider/screens/stream_provider.dart';
import 'package:provider/provider.dart';

import '../models/user_model.dart';

class FutureProviderClass extends StatelessWidget {
  const FutureProviderClass({super.key});

  Future<UserModel> fetchUserData() async{

    await Future.delayed(const Duration(seconds: 2));
    return UserModel(username: 'Rashid Ekbal', age: 21);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey, title: const Text('FutureProvider', style: TextStyle(color: Colors.white),), ),
      body: FutureProvider(
          create: (context) => fetchUserData(),
          initialData: UserModel(username: 'Loading ...', age: 0),
        child: Consumer<UserModel>(
          builder: (context, value, child){

            return (value.username == 'Loading ...')
                ? const Center(child: CircularProgressIndicator())
                : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Text("Username = ${value.username}"),
                      const SizedBox(height: 10,),
                      Text("Age = ${value.age}"),

                      const SizedBox(height: 20,),
                      ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => StreamProviderClass(),)), child: Text('StreamProvider'))
                    ],
                  ),
                );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(accountName: Text('Unknown'), accountEmail: Text('unknown@gmail.com'), currentAccountPicture: CircleAvatar(radius: 20,),),
            ListTile(title: const Text('Future Provider'), onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => FPractice(),));
            },),
            ListTile(title: const Text('Stream Provider'), onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => FPractice(),));
            },),
          ],
        ),
      ),
    );
  }
}
