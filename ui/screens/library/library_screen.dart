import 'package:advanced_flutter/W8-Library-ViewModel/ui/screens/library/view_model/library_view_model.dart';
import 'package:advanced_flutter/W8-Library-ViewModel/ui/screens/library/widgets/library_content.dart';
import 'package:advanced_flutter/W8-Library-ViewModel/ui/states/player_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/repositories/songs/song_repository.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LibraryViewModel(
        repository: context.read<SongRepository>(),
        playerState: context.read<PlayerState>(),
      ),
      child: LibraryViewContent()
    );
  }
}