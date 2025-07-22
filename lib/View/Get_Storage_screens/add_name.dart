import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_reviews/Services/get_storage/get_storage.dart';
import 'package:get_reviews/View/Get_Storage_screens/add_email.dart';
import 'package:get_reviews/View/Get_Storage_screens/mainScreen.dart';
import 'package:get_reviews/View/Get_Storage_screens/widget/CustomButton.dart';
import 'package:get_reviews/View/Get_Storage_screens/widget/Custom_textformfield.dart';
class AddName extends StatefulWidget {
  const AddName({super.key});

  @override
  State<AddName> createState() => _AddNameState();
}

class _AddNameState extends State<AddName> {
  TextEditingController nameController=TextEditingController();
  DataManager controller = DataManager();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton( icon: Icon(Icons.arrow_back), onPressed:(){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GetStorageScreen()),
          );
        } ,),
      ),
      body:Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              label: "Name",
              icon: Icons.person,
              controller: nameController,
              hint: "Enter your Name",
              validatorType: ValidatorType.name,
            ),
            SizedBox(height: 30,),
            CustomButton(title: "Next", onPressed: (){
              if (_formKey.currentState!.validate()) {
                controller.addName(nameController.text);
                Get.snackbar("Success", "Stored your Name", backgroundColor: Colors.green);
                setState(() {
                  nameController.clear();
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddEmail()),
                );
              } else {
                Get.snackbar("Error", "Enter a valid Name", backgroundColor: Colors.red);
              }
            }),

        ],),
      ) ,
    );
  }
}
