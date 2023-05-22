import 'package:flutter/material.dart';
git config --global user.email "wambokenya@gmail.com"

import 'package:flutter_riverpod/flutter_riverpod.dart';
void main() {
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yellowdot',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});

class MyHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. watch the counterStateProvider
    final counter = ref.watch(counterStateProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.5,
          //color: Colors.blueAccent,
          backgroundColor: Colors.white,
          title: Text('Yellowdotapp - byDaniel',style: TextStyle(
            //fontSize: 14,
            color: Colors.black,
          )),




        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(10, 12, 10, 0),
          child: Column(
            children:[

              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Text('Shopping Cart'),
              ),
              SizedBox(height: 18),

              Row(
                children: [
                  Container(
                  width:  80.0,
                  height: 80.0,
                    decoration: BoxDecoration(
                      color: Colors.yellow[300],

                      borderRadius: BorderRadius.circular(20.0),

                    ),

                  child: Center(
                    child: Container(
                      width:60.0 ,
                      height: 60.0,
                      padding: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                          color: Colors.yellowAccent[100],
                          image: DecorationImage(
                              fit: BoxFit.scaleDown,
                              image: NetworkImage('https://yellowdotstorage.blob.core.windows.net/user/products/1677754206919/product-image.jpg?sv=2021-06-08&ss=bfqt&srt=co&sp=rwdlacupiytfx&se=2024-08-18T19:49:57Z&st=2022-08-18T11:49:57Z&spr=https&sig=zO5ZOgBPYf9cW%2BVojXU5Ft2kFaJ50wfecDrLh3QQ5bw%3D')
                      ),
                      borderRadius: BorderRadius.circular(20.0),

                    ),

                    ),

                  ),



            ),
                  SizedBox(height: 12.0,),
                  Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Column(
                      children: [
                        Container(
                            width: 100.0,
                            child: Text('Inerter Charger', style: TextStyle(
                              fontWeight: FontWeight.bold,fontSize: 14,
                            ),)),

                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            InkWell(
                              onTap: () => ref.read(counterStateProvider.state).state--,
                              child: Container(
                                width: 30.0,
                                height: 30.0,

                                decoration: BoxDecoration(
                                  color: Colors.brown[900],

                                  borderRadius: BorderRadius.circular(4.0),

                                ),
                                child: Icon(Icons.remove, color:Colors.white,
                              size: 20.0,),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal:  8.0),
                              child:  Text(
                                ' $counter',
                                style: Theme.of(context).textTheme.headline4,
                              )
                            ),

                            InkWell(
                              onTap: () => ref.read(counterStateProvider.state).state++,
                              child: Container(
                                width: 30.0,
                                height: 30.0,

                                decoration: BoxDecoration(
                                  color: Colors.brown[900],

                                  borderRadius: BorderRadius.circular(4.0),

                                ),
                                child: Icon(Icons.add, color:Colors.white,
                                  size: 20.0,),
                              ),
                            ),
                          ],
                        ),

                      ],

                    ),
                  ),
                ],
              ),]
          ),
        ),
      ),
    );
  }
}