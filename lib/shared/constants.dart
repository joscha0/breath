// default values
const int totalTimeSecondsDefault = 300;
const int breathTimeMillisecondsDefault = 5500;
const int maxTotalTimeSeconds = 3570;
const int maxBreathTimeMilliseconds = 59500;

// get storage
const String boxTotalTime = 'totalTime';
const String boxBreathTime = 'breathTime';
const String boxBackgroundColor = 'backgroundColor';

// themes
enum BackgroundColors {
  blue,
  red,
  green,
  orange,
  indigo,
  black,
}

const BackgroundColors defaultBackgroundColor = BackgroundColors.blue;
