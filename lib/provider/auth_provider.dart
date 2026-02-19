import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  setloading(bool value) {
    _loading = value;
    notifyListeners();
  }
  //GET
  void test()async{
    try{var response = await get(Uri.parse('https://reqres.in/api/users/2'));
      print("Success!");
    }catch(e)
    {print(e);}
  }
//login POST
  void login(String email, String password) async {
    setloading(true);
    try {
      Response response = await post(
        Uri.parse('https://reqres.in/api/login'),
        body: {'email': email, 'password': password},
      );
      if (response.statusCode == 200) {
        setloading(false);
        print('SuccessFul');
      } else {
        print("Failed");
        setloading(false);
      }
    } catch (e) {
      setloading(false);
      print(e.toString());
    }
  }
}
