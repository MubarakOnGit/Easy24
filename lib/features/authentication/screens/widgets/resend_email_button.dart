import 'package:flutter/material.dart';
import 'dart:async';

class ResendEmailButton extends StatefulWidget {
  const ResendEmailButton({super.key});

  @override
  _ResendEmailButtonState createState() => _ResendEmailButtonState();
}

class _ResendEmailButtonState extends State<ResendEmailButton> {
  bool _isResendDisabled = false;
  int _countdownTime = 60; // 1 minute in seconds
  Timer? _timer;

  void _startTimer() {
    setState(() {
      _isResendDisabled = true;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_countdownTime > 0) {
          _countdownTime--;
        } else {
          timer.cancel();
          _isResendDisabled = false;
          _countdownTime = 60; // Reset the countdown time
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(textStyle: TextStyle(fontSize: 15)),
        onPressed:
            _isResendDisabled
                ? null
                : () {
                  // Add your resend email logic here
                  _startTimer();
                },
        child:
            _isResendDisabled
                ? Text('Resend in $_countdownTime seconds')
                : const Text('Resend Email'),
      ),
    );
  }
}
