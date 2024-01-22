import 'package:flutter/material.dart';
import 'package:flutter_music_appl/components/nue_box.dart';
import 'package:flutter_music_appl/components/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  //convert duration into min:sec
  String formatTime(Duration duration) {
    String twoDigitSeconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    String formattedTime = "${duration.inMinutes}:$twoDigitSeconds";
    return formattedTime;
  }

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
                        Icons.arrow_back_sharp,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // start time
                          Text(
                            // value.currentDuration.toString(),
                            formatTime(value.currentDuration),
                            style: const TextStyle(fontSize: 18),
                          ),
                          //shuffle icon
                          const Icon(
                            Icons.shuffle,
                            size: 30,
                          ),
                          //repeat icon
                          const Icon(
                            Icons.repeat,
                            size: 30,
                          ),
                          //end time
                          Text(
                            // value.totalDuration.toString(),
                            formatTime(value.totalDuration),
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 0,
                        ),
                      ),
                      child: Slider(
                        min: 0,
                        max: value.totalDuration.inSeconds.toDouble(),
                        value: value.currentDuration.inSeconds.toDouble(),
                        activeColor: Colors.greenAccent,
                        onChanged: (double double) {
                          //during when the user is sliding around
                        },
                        onChangeEnd: (double double) {
                          //sliding has finished, go to that position in song duration
                          value.seek(Duration(seconds: double.toInt()));
                        },
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
                        onTap: value.playPreviousSong,
                        child: const NeuBox(
                          child: Icon(Icons.skip_previous),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    //pause or resume/play song
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: value.pauseOrResume,
                        child: NeuBox(
                          child: Icon(
                            value.isPlaying ? Icons.pause : Icons.play_arrow,
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
                        onTap: value.playNextSong,
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
