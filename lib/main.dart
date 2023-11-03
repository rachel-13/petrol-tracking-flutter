import 'package:flutter/material.dart';

import 'extensions/DateUtils.dart';
import 'model/PetrolRecord.dart';

void main() {
  runApp(const PetrolTrackerApp());
}

class PetrolTrackerApp extends StatelessWidget {
  const PetrolTrackerApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Petrol Tracker',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
          useMaterial3: true),
      home: PetrolHomePage(),
    );
  }
}

class PetrolHomePage extends StatelessWidget {
  List<PetrolRecord> data = [
    PetrolRecord(
        datetime: DateTime.now(),
        petrolBrand: "Petronas",
        price: 70.01,
        kmPerLiter: 10.0),
    PetrolRecord(
        datetime: DateTime.now(),
        petrolBrand: "BHP",
        price: 65.05,
        kmPerLiter: 9.7),
  ];

  PetrolHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget page;

    if (data.isEmpty) {
      page = const EmptyRecordPage();
    } else {
      page = PetrolListView(data: data);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('History'),
      ),
      body: page,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const Placeholder(),
                fullscreenDialog: true),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class PetrolListView extends StatelessWidget {
  const PetrolListView({
    super.key,
    required this.data,
  });

  final List<PetrolRecord> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          title: Text(data[index].datetime.parseToDate()),
          subtitle: Text("${data[index].kmPerLiter} km/liter"),
          leading: const Icon(Icons.gas_meter_outlined),
          trailing: Text("RM${data[index].price}",
              style: Theme.of(context).textTheme.labelMedium),
        ),
      ),
    );
  }
}

class EmptyRecordPage extends StatelessWidget {
  const EmptyRecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You have no data!",
                style: Theme.of(context).textTheme.bodyLarge)
          ],
        ),
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'Bla',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
