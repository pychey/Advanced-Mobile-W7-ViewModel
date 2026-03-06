import 'package:advanced_flutter/W8-Library-ViewModel/data/repositories/songs/song_repository.dart';
import 'package:advanced_flutter/W8-Library-ViewModel/model/songs/song.dart';
import 'package:advanced_flutter/W8-Library-ViewModel/ui/states/player_state.dart';
import 'package:flutter/widgets.dart';

class LibraryViewModel extends ChangeNotifier {
  final SongRepository repository;
  final PlayerState playerState;

  List<Song> songs = [];

  LibraryViewModel({required this.repository, required this.playerState}) {
    playerState.addListener(_onPlayerStateChanged);
    init();
  }

  void init() {
    songs = repository.fetchSongs();
    notifyListeners();
  }

  void _onPlayerStateChanged() {
    notifyListeners();
  }

  bool isPlaying(Song song) => playerState.currentSong == song;

  void playSong(Song song) => playerState.start(song);

  void stopSong() => playerState.stop();

  @override
  void dispose() {
    playerState.removeListener(_onPlayerStateChanged);
    super.dispose();
  }
}