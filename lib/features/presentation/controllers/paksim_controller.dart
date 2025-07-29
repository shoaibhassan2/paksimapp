// lib/features/presentation/controllers/paksim_controller.dart

import 'package:flutter/material.dart';
import 'package:paksimapp/features/data/models/sim_data_model.dart';
import 'package:paksimapp/features/data/services/pak_sim_service.dart';

// This sealed class represents all possible states of our screen
sealed class PakSimState {}

class PakSimInitial extends PakSimState {} // Initial state, nothing has happened

class PakSimLoading extends PakSimState {} // Data is being fetched

class PakSimSuccess extends PakSimState { // Data was fetched successfully
  final List<SimDataModel> results;
  PakSimSuccess(this.results);
}

class PakSimError extends PakSimState { // An error occurred
  final String message;
  PakSimError(this.message);
}


// The controller that manages the state
class PakSimController extends ValueNotifier<PakSimState> {
  PakSimController() : super(PakSimInitial());

  Future<void> search(String mobileNumber) async {
    // --- 1. INPUT VALIDATION ---
    if (mobileNumber.isEmpty) {
      value = PakSimError('Please enter a phone number or CNIC.');
      return;
    }
    if (mobileNumber.length < 10) {
      value = PakSimError('Input must be at least 10 digits long.');
      return;
    }

    // --- 2. SET LOADING STATE ---
    value = PakSimLoading();

    // --- 3. CALL SERVICE AND HANDLE OUTCOME ---
    try {
      final results = await PakSimService.fetchSimData(mobileNumber);
      if (results.isNotEmpty) {
        value = PakSimSuccess(results);
      } else {
        // This case is technically handled by the service, but as a fallback:
        value = PakSimError('No data found for this number.');
      }
    } catch (e) {
      value = PakSimError(e.toString().replaceFirst('Exception: ', ''));
    }
  }

  // Method to reset state, e.g., after closing a dialog
  void reset() {
    value = PakSimInitial();
  }
}