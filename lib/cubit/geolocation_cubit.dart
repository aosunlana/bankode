import 'package:bankode/data/repositories/location_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'geolocation_state.dart';

class GeolocationCubit extends Cubit<GeolocationState> {
  final LocationRepository locationRepository;
  GeolocationCubit(this.locationRepository) : super(GeolocationLoadingState());


  Future<void> getPositionStream() async {
    try {
      final result = await locationRepository.determinePosition();
      emit(GeolocationLoadedState(result));
    } catch(e) {
      debugPrint(e.toString());
    }
  }

  }
