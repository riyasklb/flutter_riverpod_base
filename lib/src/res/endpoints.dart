import 'package:flutter_riverpod_base/src/res/base.dart';


/// Contains all the API endpoints used in the application.
/// Example :
/// 
/// An endpoint can be used the following way
/// ```dart
/// final response = await http.get(Endpoints.getUser)
/// ```

class Endpoints{


  static const getProducts = "https://api.github.com/search/repositories?q=created:>2022-04-29&sort=stars&order=desc";
}