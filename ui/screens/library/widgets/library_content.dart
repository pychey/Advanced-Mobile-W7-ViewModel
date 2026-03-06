import 'package:advanced_flutter/W8-Library-ViewModel/model/songs/song.dart';
import 'package:advanced_flutter/W8-Library-ViewModel/ui/screens/library/view_model/library_view_model.dart';
import 'package:advanced_flutter/W8-Library-ViewModel/ui/states/settings_state.dart';
import 'package:advanced_flutter/W8-Library-ViewModel/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LibraryViewContent extends StatelessWidget {
  const LibraryViewContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<LibraryViewModel>();
    final settingsState = context.read<AppSettingsState>();
    
    return Container(
      color: settingsState.theme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Library", style: AppTextStyles.heading),
    
          SizedBox(height: 50),
    
          Expanded(
            child: ListView.builder(
              itemCount: vm.songs.length,
              itemBuilder: (context, index) => SongTile(
                song: vm.songs[index],
                isPlaying: vm.isPlaying(vm.songs[index]),
                onTap: () => vm.playSong(vm.songs[index]),
                onStop: () => vm.stopSong(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.song,
    required this.isPlaying,
    required this.onTap, 
    required this.onStop,
  });

  final Song song;
  final bool isPlaying;
  final VoidCallback onTap;
  final VoidCallback onStop;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Row(
        spacing: 16,
        children: [
          Text(song.title),
          Text(
            isPlaying ? "Playing" : "",
            style: TextStyle(color: Colors.amber),
          ),
        ],
      ),
      trailing: isPlaying
      ? IconButton(onPressed: onStop, icon: Icon(Icons.stop_circle_outlined))
      : null,
    );
  }
}

