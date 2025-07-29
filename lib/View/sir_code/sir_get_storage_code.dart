
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

//---> structure---> maping data
//--> key and value
//'userid': userid,
//'name':name

class UserIdManager {
  static const String _userIdKey = 'userId';
  static String username='username';// key name not a  value
  static final UserIdManager _instance = UserIdManager._internal();
  factory UserIdManager() => _instance;
  UserIdManager._internal();

  // Get Storage package object
  final GetStorage _storage = GetStorage();
  addToken(String token)
  async{
    await _storage.write('token', token);
  }
  getToken()async{
    return _storage.read('token');
  }
  addId(int id )async
  {
    await _storage.write(_userIdKey, id);
  }

  getId()
  async{
    return _storage.read(_userIdKey);
  }
  addname(String name)
  async{
    await _storage.write(username, name);
  }

  getName()async
  {
    await _storage.read(username);

  }


  Future<void> addUserId(int userId) async {
    await _storage.write(_userIdKey, userId);
  }

  Future<void> removeUserId() async {
    await _storage.remove(_userIdKey);
  }

  int? getUserId() {
    return _storage.read(_userIdKey);
  }
}







class InsertData extends StatefulWidget {
  const InsertData({super.key});

  @override
  State<InsertData> createState() => _InsertDataState();
}

class _InsertDataState extends State<InsertData> {
  TextEditingController nameController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        TextFormField(
          controller: nameController,
        ),
        FloatingActionButton(onPressed: ()async{
          UserIdManager iserIdManager=UserIdManager();
          if(nameController!=null || nameController!="")
          {
            iserIdManager.addname(nameController.text);
          }
        })
      ],),
    );
  }
}



class FetchData extends StatefulWidget {
  const FetchData({super.key});

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  String username='';
  UserIdManager iserIdManager=UserIdManager();
  getData()
  async{
    username=await iserIdManager.getName();
    setState(() {

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // username=await iserIdManager.getName();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(username),
      ),
    );
  }
}