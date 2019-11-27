import 'package:bolha_musical/redux/reducers.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'app_state.dart';
final _initialState = AppState();
Store<AppState> store =  Store<AppState>(reducer,
    initialState: _initialState, middleware: [thunkMiddleware]);
