/*import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:timezone/timezone.dart';

part 'time.g.dart';

@Riverpod(keepAlive: true)
Location tzLocation(TzLocationRef ref) {
  return getLocation('Europe/Berlin');
}

@Riverpod(keepAlive: true)
DateTime now(NowRef ref) {
  return ref.watch(nowStreamProvider).valueOrNull ?? DateTime.now();
}

@Riverpod(keepAlive: true)
Stream<DateTime> nowStream(NowStreamRef ref) {
  final location = ref.watch(tzLocationProvider);
  return Stream.periodic(const Duration(milliseconds: 499))
      .map((_) => TZDateTime.now(location));
}*/
