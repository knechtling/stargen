import 'dart:math';

String createStarPath(int points, double innerRadius, double outerRadius, double centerX, double centerY) {
  final StringBuffer path = StringBuffer();
  final double step = pi / points;
  List<String> pointsList = [];

  for (int i = 0; i < points * 2; i++) {
    double radius = i.isEven ? outerRadius : innerRadius;
    double x = centerX + cos(i * step) * radius;
    double y = centerY + sin(i * step) * radius;
    pointsList.add('${x.toStringAsFixed(2)},${y.toStringAsFixed(2)}');
  }

  path.write('M ${pointsList.join(' L ')} Z');
  return path.toString();
}

void main() {
  final Random random = Random();
  final List<int> possiblePoints = [5];
  const double minRadius = 10.0;
  const double maxRadius = 50.0;
  const double centerX = 60.0;
  const double centerY = 60.0;

  final int points = possiblePoints[random.nextInt(possiblePoints.length)];
  final double outerRadius = random.nextDouble() * (maxRadius - minRadius) + minRadius;
  final double innerRadius = outerRadius / 2;
  final int rotation = random.nextInt(360);

  final String starPath = createStarPath(points, innerRadius, outerRadius, centerX, centerY);

  print('<svg xmlns="http://www.w3.org/2000/svg" width="120" height="120">');
  print('<path d="$starPath" fill="yellow" stroke="black" stroke-width="1" transform="rotate($rotation $centerX $centerY)"/>');
  print('</svg>');
}
