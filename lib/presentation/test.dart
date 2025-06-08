import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});
  static late Box box;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () async => box = await Hive.openBox("ProfileData"), child: Text("Open Box")),
              ElevatedButton(onPressed: () => box.put("name", "Mai"), child: Text("put data")),
              ElevatedButton(onPressed: () =>  box.putAll({"name": "Mai", "email":"emadmai555@gmail.com",  "Age": 21 , "price": 250}), child: Text("put all data")),
              ElevatedButton(onPressed: () =>  box.putAt(0, 25), child: Text("put at data")),
              ElevatedButton(onPressed: () =>  box.putAt(1, 300), child: Text("put at data")),

              ElevatedButton(onPressed: () =>  print(box.get("name")), child: Text("print data")),
             ElevatedButton(onPressed: ()=>  print(box.values.toList()), child: Text("Print All data"))
                
            ],
          ),
        ),
      ),
    );
  }
}
