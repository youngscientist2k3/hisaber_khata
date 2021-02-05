import 'package:hisaber_khata/constants/constants_common.dart' as constCommon;

String dateTimeNow() =>
    '${DateTime.now().day} ${constCommon.months[DateTime.now().month.toString()]} ${DateTime.now().year}';
