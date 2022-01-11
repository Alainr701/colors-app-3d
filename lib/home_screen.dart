import 'package:colors/components/custom_scroll.dart';
import 'package:colors/components/scroll_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<ScrollProvider>(context);
    return Scaffold(

      appBar: AppBar(
        backgroundColor: _controller.colors,
        elevation: 0,
        title: const Text('Colors',
            style: TextStyle(shadows: [
              Shadow(
                blurRadius: 3.0,
                color: Colors.black,
                offset: Offset(6.0, 4.0),
              ),
            ])),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(color: _controller.colors),
          const Center(child: CustomScroll()),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: _controller.random,
            child: const Icon(Icons.refresh),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () => _show(context, _controller),
              child: const Icon(Icons.open_in_browser)),
        ],
      ),
    );
  }
}

//Alert Dialog
Future<void> _show(context, ScrollProvider color) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      String data = color.colors.toString().toUpperCase();
      data = data.substring(10, data.length - 1);
      return AlertDialog(
        title: const Text('Data Your Color'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                  'HEX: #$data\nRGB: (${color.red}, ${color.green}, ${color.blue})'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('copy'),
            onPressed: () {
              // print()
              Clipboard.setData(ClipboardData(
                  text:
                      'Hex: #$data \nRGB: (${color.red}, ${color.green}, ${color.blue}) '));
            },
          ),
          TextButton(
            child: const Text('ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
