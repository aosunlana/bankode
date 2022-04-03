import 'dart:developer';
import 'package:bankode/data/repositories/location_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'geolocation_state.dart';

class GeolocationCubit extends Cubit<GeolocationState> {
  final LocationRepository locationRepository;
  GeolocationCubit(this.locationRepository) : super(GeolocationLoadingState());


  Future<void> getPositionStream() async {
    try {
      final result = await locationRepository.determinePosition();
      List<Placemark> placemarks = await placemarkFromCoordinates(result.latitude, result.longitude);
      log(placemarks.toString());
      emit(GeolocationLoadedState(placemarks));
    } catch(e) {
      debugPrint(e.toString());
    }
  }

  }
