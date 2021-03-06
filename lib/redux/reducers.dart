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
    newState.bolhasDisponiveis = action.payload;
  }
  if (action is setLastSearchResult) {
    newState.lastSearchResult = action.payload;
  }

  if (action is SetSearchingTrack) {
    newState.searchingTrack = action.payload;
  }

  if (action is SetPlaylist) {
    newState.playlist = action.payload;
  }

  if (action is SetCurrentPlaying) {
    newState.currentPlaying = action.payload;
  }

  if (action is SetDevices) {
    newState.devices = action.payload;
  }

  if (action is SetMessages) {
    newState.messages = action.payload;
  }

  if (action is SetReferenciasTamanhoBolha) {
    newState.referenciasTamanhoBolha = action.payload;
  }
  if (action is SetCurrentAppState) {
    newState.currentAppState = action.payload;
  }

  if (action is SetNotificacaoMessages) {
    newState.notificacaoMessages = action.payload;
  }

  return newState;
}
