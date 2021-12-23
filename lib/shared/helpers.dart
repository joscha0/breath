import 'constants.dart';

BackgroundColors backgroundColorFromString(String backgroundColor) {
  return BackgroundColors.values
      .firstWhere((element) => element.toString() == backgroundColor);
}
