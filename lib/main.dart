import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practise_app/ProverModel/CounterModel.dart';
import 'package:provider_practise_app/Video_Screen/VIdeosScreen.dart';

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (BuildContext context) => Countermodel(),
//       child: ProviderApp(),
//     ),
//   );
// }

void main() => runApp(VideosAPP());

class VideosAPP extends StatefulWidget {
  const VideosAPP({super.key});

  @override
  State<VideosAPP> createState() => _VideosAPPState();
}

class _VideosAPPState extends State<VideosAPP> {
  @override
  Widget build(BuildContext context) {
    print("Build");
    return MaterialApp(home: GoogleDriveVideoScreen());
  }
}

class ProviderApp extends StatefulWidget {
  const ProviderApp({super.key});

  @override
  State<ProviderApp> createState() => _ProviderAppState();
}

class _ProviderAppState extends State<ProviderApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // final counter = Provider.of<Countermodel>(context);
    print("BUild");
    return Scaffold(
      body: Consumer<Countermodel>(
        builder: (BuildContext context, Countermodel value, Widget? child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: Text('Counter :${value.Counter}')),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    value.increment();
                  },
                  child: Text("Increment "),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
