import 'package:bolha_musical/api/TrackApi.dart';
import 'package:bolha_musical/pages/playlist/widgets/playlist_search_item.dart';
import 'package:bolha_musical/redux/app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class PlayListSearch extends StatefulWidget {
  @override
  PlayListSearchState createState() {
    return PlayListSearchState();
  }
}

class PlayListSearchState extends State<PlayListSearch> {
  TextEditingController _textFieldController = TextEditingController();

  @override
  initState() {
    super.initState();
    TrackApi.search("");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Buscar'),
        backgroundColor: Color.fromRGBO(1, 41, 51, 1),
      ),
      body: Column(
        children: <Widget>[inputSearch(), result()],
      ),
    );
  }

  result() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.79,
      child: StoreConnector<AppState, AppState>(
          converter: (store) => store.state,
          builder: (context, state) {
            // return Center(child: CircularProgressIndicator());
            if (state.searchingTrack) {
              return Center(child: CircularProgressIndicator());
            } else {
              return SafeArea(
                child: AnimationLimiter(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: state.lastSearchResult.tracks.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                            child: PlayListSearchItem(
                                width: 50,
                                height: 80,
                                track: state.lastSearchResult.tracks[index]),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            }
          }),
    );
  }

  inputSearch() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: MediaQuery.of(context).size.height * 0.10,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _textFieldController,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration.collapsed(
                hintText: 'Darude - Sandstorm',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 25.0,
            color: Colors.black,
            onPressed: () {
              TrackApi.search(_textFieldController.value.text);
            },
          ),
        ],
      ),
    );
  }
}
