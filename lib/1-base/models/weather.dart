class Weather {
  final double temp;
  final double feelsLike;
  final double low;
  final double high;
  final double humidity;
  final double wind;
  final String description;

  Weather({this.temp, this.feelsLike, this.low, this.high, this.description, this.humidity, this.wind});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temp: json['main']['temp'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      low: json['main']['temp_min'].toDouble(),
      high: json['main']['temp_max'].toDouble(),
      humidity: json['main']['humidity'].toDouble(),
      wind: json['wind']['speed'].toDouble(),
      description: json['weather'][0]['description'],
    );
  }
}