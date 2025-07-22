import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_reviews/Services/get_storage/get_storage.dart';
import 'package:get_reviews/View/Get_Storage_screens/FetchDataScreen.dart';
import 'package:get_reviews/View/Get_Storage_screens/widget/CustomButton.dart';
import 'package:get_reviews/View/Get_Storage_screens/widget/Custom_textformfield.dart';
class AddNumber extends StatefulWidget {
  const AddNumber({super.key});

  @override
  State<AddNumber> createState() => _AddNumberState();
}

class _AddNumberState extends State<AddNumber> {
  TextEditingController numberController = TextEditingController();
  DataManager controller = DataManager();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              label: "Phone Number",
              icon: Icons.phone,
              controller: numberController,
              hint: "Enter your Number",
              validatorType: ValidatorType.number,
            ),
            SizedBox(height: 30,),
            CustomButton(title: "Next", onPressed: () {
              if (_formKey.currentState!.validate()) {
                controller.addNumber(numberController.text);
                Get.snackbar("Success", "Stored your Number", backgroundColor: Colors.green);
                setState(() {
                  numberController.clear();
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FetchDataScreen()),
                );
              } else {
                Get.snackbar("Error", "Enter a valid Number", backgroundColor: Colors.red);
              }
            },
            ),
          ],),
      ) ,
    );
  }
}
