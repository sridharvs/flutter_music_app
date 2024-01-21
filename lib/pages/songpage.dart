import 'package:flutter/material.dart';
import 'package:flutter_music_appl/components/nue_box.dart';
import 'package:flutter_music_appl/components/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(builder: (context, value, child) {
      //get playlist
      final playlist = value.playlist;
      //get current song index
      final currentSong = playlist[value.currentSongIndex ?? 0];
      //return scaffold UI
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //app bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //back button
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back,
                      ),
                    ),
                    //title
                    const Text(
                      "P L A Y L I S T",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    //menu button
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),

                //album artwork
                NeuBox(
                  child: Column(
                    children: [
                      //for image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(currentSong.albumartImagePath),
                      ),
                      // song & artist name
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //song and artist name
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentSong.songName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text(currentSong.artistName),
                              ],
                            ),
                            //favrite icon
                            const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),

                //song duration process
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // start time
                          Text(
                            "0:00",
                            style: TextStyle(fontSize: 18),
                          ),
                          //shuffle icon
                          Icon(
                            Icons.shuffle,
                            size: 30,
                          ),
                          Icon(
                            Icons.repeat,
                            size: 30,
                          ),
                          Text(
                            "0:00",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 5,
                        ),
                      ),
                      child: Slider(
                        min: 0,
                        max: 100,
                        value: 50,
                        activeColor: Colors.greenAccent,
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                //playback controls
                Row(
                  children: [
                    //skip previos song
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: const NeuBox(
                          child: Icon(
                            Icons.skip_previous,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    //pause song
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        child: const NeuBox(
                          child: Icon(
                            Icons.pause,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    //skip forward
                    Expanded(
                      child: GestureDetector(
                        child: const NeuBox(
                          child: Icon(
                            Icons.skip_next,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
