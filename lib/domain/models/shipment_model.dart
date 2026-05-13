enum ShipmentStatus { pending, inTransit, delivered, outForDelivery }

class ExpressShipment {
  final String trackingId;
  final String packageName;
  final String sender;
  final String receiver;
  final String estimatedDelivery;
  final ShipmentStatus status;
  final List<TrackingStep> history;

  ExpressShipment({
    required this.trackingId,
    required this.packageName,
    required this.sender,
    required this.receiver,
    required this.estimatedDelivery,
    required this.status,
    this.history = const [],
  });
}

class TrackingStep {
  final String title;
  final String location;
  final DateTime timestamp;
  final bool isCompleted;

  TrackingStep({
    required this.title,
    required this.location,
    required this.timestamp,
    this.isCompleted = false,
  });
}
