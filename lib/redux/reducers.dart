import 'package:bolha_musical/redux/actions.dart';
import 'package:bolha_musical/redux/app_state.dart';

AppState reducer(AppState prevState, dynamic action) {
  AppState newState = AppState.fromAppState(prevState);
  if (action is SetAuthState) {
    newState.authState = action.payload;
  }
  if (action is SetToken) {
    newState.token = action.payload;
  }
  if (action is SetME) {
    newState.me = action.payload;
  }
  if (action is SetMessage) {
    newState.messages.add(action.payload);
  }

  if (action is SetLocalizacaoAtual) {
    newState.localizacaoAtual = action.payload;
  }

  if (action is SetBolhaAtual) {
    newState.bolhaAtual = action.payload;
  }
  if (action is SetCurrentBottomBarIndex) {
    newState.currentBottomBarIndex = action.payload;
  }
  if (action is SetBolhasDisponiveis) {
    print("current");
    print(prevState.bolhasDisponiveis);
    print("SetBolhasDisponiveis");
    print( action.payload);
    newState.bolhasDisponiveis = action.payload;
  }

  return newState;
}
