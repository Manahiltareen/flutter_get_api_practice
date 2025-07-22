import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_reviews/Services/get_storage/get_storage.dart';
import 'package:get_reviews/View/Get_Storage_screens/add_name.dart';
import 'package:get_reviews/View/Get_Storage_screens/add_number.dart';
import 'package:get_reviews/View/Get_Storage_screens/widget/CustomButton.dart';
import 'package:get_reviews/View/Get_Storage_screens/widget/Custom_textformfield.dart';
class AddEmail extends StatefulWidget {
  const AddEmail({super.key});

  @override
  State<AddEmail> createState() => _AddEmailState();
}

class _AddEmailState extends State<AddEmail> {
  TextEditingController emailController = TextEditingController();
  DataManager controller = DataManager();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton( icon: Icon(Icons.arrow_back), onPressed:(){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddName()),
          );
        } ,),
      ),
      body:Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              label: "Email",
              icon: Icons.email,
              controller: emailController,
              hint: "Enter your Email",
              validatorType: ValidatorType.email,
            ),
            SizedBox(height: 30,),
            CustomButton(title: "Next", onPressed: (){
              if (_formKey.currentState!.validate()) {
                controller.addEmail(emailController.text);
                Get.snackbar("Success", "Stored your Email", backgroundColor: Colors.green);
                setState(() {
                  emailController.clear();
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddNumber()),
                );
              } else {
                Get.snackbar("Error", "Enter a valid Email", backgroundColor: Colors.red);
              }
            }),

          ],),
      ) ,
    );
  }
}
