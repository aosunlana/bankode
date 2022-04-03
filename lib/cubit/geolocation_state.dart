import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';

abstract class GeolocationState extends Equatable {
  const GeolocationState();
}

class GeolocationLoadingState extends GeolocationState {
  @override
  List<Object> get props => [];
}

class GeolocationLoadedState extends GeolocationState {
final List<Placemark> position;

const GeolocationLoadedState(this.position);

  @override
  List<Object?> get props => [position];

}