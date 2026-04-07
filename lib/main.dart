import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_state_management/models/post.dart';
import 'package:flutter_test_state_management/providers/counter.provider.dart';
import 'package:flutter_test_state_management/providers/post.provider.dart';
import 'package:flutter_test_state_management/providers/product.provider.dart';
import 'package:flutter_test_state_management/providers/weather.provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    final product = ref.watch(productProvider);

    final AsyncValue<String> weatherProvide = ref.watch(weatherProfider);

    final AsyncValue<List<Post>> postProvide = ref.watch(postProvider);


    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("test"),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: .center,
              children: [
            
            
                Text("Product List "), 
            
                postProvide.when(
                  data:(data){
                   return ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(data[index].title),
                          subtitle: Text(data[index].description),
                        );
                      },
                    );
                  },
                  error: (error, stackTrace) {
                    return ElevatedButton(
                      onPressed: () => {
                        ref.refresh(postProvider),
                        //ref.read(productProvider.notifier).changePrice(),
                      },
                      child: Text("retry"),
                    );
                  },
                  loading: () => CircularProgressIndicator(),
                ),
            
            
            
                // weatherProvide.when(
                //   data: (data) {
                //     return Text(data);
                //   },
                //   error: (error, stackTrace) {
                //     return ElevatedButton(
                //       onPressed: () => {
                //         ref.refresh(weatherProfider),
                //         //ref.read(productProvider.notifier).changePrice(),
                //       },
                //       child: Text("retry"),
                //     );
                //   },
                //   loading: () {
                //     return CircularProgressIndicator();
                //   },
                // ),
            
                //Text('$count', style: Theme.of(context).textTheme.headlineMedium),
                
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(counterProvider.notifier).state++;
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
