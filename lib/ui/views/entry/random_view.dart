import 'dart:async';
import 'dart:developer';


Stream<int> sendBoat(max) async* {
  for(int i = 0; i <= max; i++) {
    log("sent boat number: " + i.toString());
    await Future.delayed(const Duration(seconds: 1));
    yield i;

  }
}

Future<void> main() async {

  Stream<int> sender = sendBoat(15);

  StreamSubscription receiver = sender.listen((data) {log("Received boat ${data * 10}");});
  log(receiver.toString());
}
