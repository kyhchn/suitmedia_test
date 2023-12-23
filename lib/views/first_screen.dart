import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:suitmedia_test/views/widgets/suitmedia_button.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _palindromeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg.png"), fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: const AssetImage("assets/images/ic_photo.png"),
            width: 30.w,
            height: 30.w,
          ),
          SizedBox(
            height: 51 / 812 * 100.h,
          ),
          textField(_nameController, "Name"),
          const SizedBox(
            height: 15,
          ),
          textField(_palindromeController, "Palindrome"),
          SizedBox(
            height: 45 / 812 * 100.h,
          ),
          SuitmediaButton(
            text: "CHECK",
            onPressed: _checkPalindrome,
          ),
          const SizedBox(
            height: 15,
          ),
          SuitmediaButton(
            text: "NEXT",
            onPressed: () => null,
          )
        ],
      ),
    ));
  }

  TextField textField(TextEditingController controller, String hint) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        hintStyle: TextStyle(
            color: Color(0xFF6867775C).withOpacity(0.36), fontSize: 16),
        hintText: hint,
        alignLabelWithHint: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.fromLTRB(20, 8, 16, 8),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  void _checkPalindrome() {
    final input = _palindromeController.text;
    final cleanedInput =
        input.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '').toLowerCase();
    bool isPalindrome = cleanedInput.split('').reversed.join() == cleanedInput;

    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(isPalindrome ? 'Palindrome' : 'Not Palindrome'),
        content:
            Text("$input ${isPalindrome ? 'isPalindrome' : 'not palindrome'}"),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
