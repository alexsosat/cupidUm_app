import 'package:collection/collection.dart';

// Helper functions
String enumToString(Object? o) => o.toString().split('.').last;

T? enumFromString<T>(String key, List<T> values) =>
    values.firstWhereOrNull((v) => key == enumToString(v));
