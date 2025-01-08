class Event {
  final String eventName;
  final String eventImg;
  final String minPrice;
  final String maxPrice;
  final List<String> tags;

  Event({
    this.eventName = '',
    this.eventImg = '',
    this.minPrice = '200.000',
    this.maxPrice = '800.000',
    this.tags = const [],
  });
}
