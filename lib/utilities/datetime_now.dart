import 'package:hisaber_khata/constants/common_constants.dart' as constCommon;

String dateTimeNow() =>
    '${DateTime.now().day} ${constCommon.months[DateTime.now().month.toString()]} ${DateTime.now().year}';
