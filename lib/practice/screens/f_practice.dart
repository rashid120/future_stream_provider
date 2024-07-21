import 'package:flutter/material.dart';
import 'package:future_stream_provider/practice/models/practice_model.dart';
import 'package:provider/provider.dart';

class FPractice extends StatefulWidget {
  const FPractice({super.key});

  @override
  State<FPractice> createState() => _FPracticeState();
}

class _FPracticeState extends State<FPractice> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isSaveData = false;

  Future<PracticeModel> fetchPData() async{

    await Future.delayed(const Duration(seconds: 3));
    return PracticeModel(username: usernameController.text, password: passwordController.text);
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blueGrey,),
      body: (!isSaveData)
          ? firstDesign()
          : FutureProvider(
          create: (context) => fetchPData(),
            initialData: PracticeModel(username: 'Loading ... ', password: '**********'),
            child: Consumer<PracticeModel>(builder: (context, value, child) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Text('Username = ${value.username}'),
                  const SizedBox(height: 5,),
                  Text('Password = ${value.password}'),
                ],
              ),
            );
        },),
      ),
    );
  }

  Widget firstDesign(){
    return Container(
      margin: EdgeInsets.all(30),
      child: Column(
        children: [

          const SizedBox(height: 30,),
          const Text('Login Your account', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          const SizedBox(height: 30,),

          TextField(
            controller: usernameController,
            decoration: const InputDecoration(
                labelText: 'Your username',
                border: UnderlineInputBorder()
            ),
          ),

          const SizedBox(height: 10,),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(
                labelText: 'Your password',
                border: UnderlineInputBorder()
            ),
          ),
          const SizedBox(height: 10,),

          ElevatedButton(onPressed: () {
            if(usernameController.text.isNotEmpty && passwordController.text.isNotEmpty){
              setState(() {
                isSaveData = true;
              });
            }
          }, child: const Text('Save')),
        ],
      ),
    );
  }
}
