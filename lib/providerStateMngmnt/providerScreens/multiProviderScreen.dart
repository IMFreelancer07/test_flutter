import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/providerStateMngmnt/Provider/multiP_provider.dart';

class multiProviderScreen extends StatefulWidget {
  const multiProviderScreen({super.key});

  @override
  State<multiProviderScreen> createState() => _multiProviderScreenState();
}

class _multiProviderScreenState extends State<multiProviderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MultiProvider"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<multiP_Provider>(builder: (context, value, child) {
            return Slider(
              min: 0,
              max: 1,
              value: value.value,
              onChanged: (val) {
                value.setValue(val);
              },
            );
          }),
          Consumer<multiP_Provider>(builder: (context, value, child) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(value.value),
                    ),
                    child: Center(
                      child: Text("C1"),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(value.value),
                    ),
                    child: Center(
                      child: Text("C2"),
                    ),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
