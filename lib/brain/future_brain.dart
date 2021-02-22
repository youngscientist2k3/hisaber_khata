import 'package:hisaber_khata/brain/app_brain.dart';
import 'package:provider/provider.dart';

class FutureBrain {
  List dataList;

  FutureBrain({this.dataList});

  Future fetchDatabase(context) async {
    List value = await Provider.of<AppBrain>(context).fetchDataBase();
    return FutureBrain(dataList: value);
  }
}
