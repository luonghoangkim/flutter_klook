import 'package:flutter/material.dart';

class TopSheet extends StatefulWidget {
  const TopSheet({Key? key}) : super(key: key);

  @override
  State<TopSheet> createState() => _TopSheetState();
}

class _TopSheetState extends State<TopSheet> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Material(
        // color: Colors.transparent,
        child: Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(15),
         
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Top Sheet Content',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Đóng'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showTopSheet(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (BuildContext buildContext, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return TopSheet(); // Create an instance of the StatefulWidget, not the State
    },
  );
}

class YourWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Show TopSheet when the button is pressed
            showTopSheet(context);
          },
          child: Text('Mở Top Sheet'),
        ),
      ),
    );
  }
}
 
