import 'package:appproject/model/panda_pick_model/panda_pick_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../constants/base_url.dart';
import '../constants/local_status.dart';

class PandaPickLogic extends ChangeNotifier {
  PandaPickModel _pandaPickModel = PandaPickModel(pandaPick: []);
  PandaPickModel get pandaPickModel => _pandaPickModel;

  LocalStatus _status = LocalStatus.none;
  LocalStatus get status => _status;

  void setLoading() {
    _status = LocalStatus.loading;
    notifyListeners();
  }

  Future read() async {
    final url = "http://$platform$port/mobile_project1/panda_pick/read.php";
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        _pandaPickModel = await compute(getPandaPickModel, response.body);
        _status = LocalStatus.done;
      } else {
        print("Error while reading, ${response.statusCode}");
        _status = LocalStatus.error;
      }
    } catch (e) {
      print("Error while reading, ${e.toString()}");
      _status = LocalStatus.error;
    }
    notifyListeners();
  }
}