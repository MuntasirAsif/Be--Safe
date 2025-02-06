import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final modeControllerProvider =
StateNotifierProvider<ModeController, bool>((ref) => ModeController());

class ModeController extends StateNotifier<bool> {
  ModeController() : super(false) {
    _loadMode();
  }


  Future<void> _loadMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    state = prefs.getBool('isHouseOwnerMode') ?? false;
  }


  Future<void> toggleMode() async {
    state = !state;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isHouseOwnerMode', state);
  }
}
