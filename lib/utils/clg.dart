import 'dart:developer';

void clg(
  dynamic object, {
  bool logging = true,
  String name = "LOCAL-NOTIFICATIONS-DENEMELER",
}) {
  logging ? log(object, name: name) : print("[$name] $object");
}
