import 'dart:developer';

void clg(
  dynamic object, {
  bool logging = false,
  String name = "LOCAL-NOTIFICATIONS-DENEMELER",
}) {
  logging ? log(object, name: name) : print("[$name] $object");
}
