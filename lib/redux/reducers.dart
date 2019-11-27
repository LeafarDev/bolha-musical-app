import 'package:bolha_musical/redux/app_state.dart';
import 'package:bolha_musical/redux/actions.dart';

AppState reducer(AppState prevState, dynamic action) {
  AppState newState = AppState.fromAppState(prevState);
  if (action is SetAuthState) {
    newState.authState = action.payload;
  }
  if(action is SetToken) {
    newState.token = action.payload;
  }
  if(action is SetME) {
    newState.me = action.payload;
  }
  return newState;
}
