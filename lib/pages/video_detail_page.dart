import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/video_model.dart';
import 'package:flutter_application_1/pages/channel_page.dart';
import 'package:flutter_application_1/services/api_services.dart';
import 'package:flutter_application_1/ui/general/colors.dart';
import 'package:flutter_application_1/ui/widgets/item_video_detail_widget.dart';
import 'package:flutter_application_1/ui/widgets/item_videos_widgets.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoDetailPage extends StatefulWidget {
  String videoId;
  VideoDetailPage({
    required this.videoId,
  });

  @override
  State<VideoDetailPage> createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  final APIService _apiService = APIService();
  late YoutubePlayerController _playerController;
  List<VideoModel> videos = [];
  
  get kBrandPrimaryColors => null;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    _playerController = YoutubePlayerController(
        initialVideoId: widget.videoId,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
          hideControls: false,
        ));
  }

  getData() {
    _apiService.getVideos().then((value) {
      videos = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBrandPrimaryColors,
      body: Column(
        children: [
          SizedBox(
            height: height * 0.35,
            child: YoutubePlayer(
              controller: _playerController,
              progressColors: ProgressBarColors(
                playedColor: Colors.red,
                handleColor: Colors.red,
                bufferedColor: Colors.white54,
                backgroundColor: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          ListTile(
            title: Text(
              "viajes por el mundo",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                height: 1.3,
                color: Colors.white,
                fontSize: 14.0,
              ),
            ),
            subtitle: Text(
              "6.5M de vistas · hace 2 años",
              style: TextStyle(
                color: Colors.white54,
                fontSize: 13.0,
              ),
            ),
            trailing: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(
                      16.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ItemVideoDetailWidegets(
                          text: "55 k",
                          icon: Icons.thumb_up_alt_outlined,
                        ),
                        ItemVideoDetailWidegets(
                          text: "No me gusta",
                          icon: Icons.thumb_down_alt_outlined,
                        ),
                        ItemVideoDetailWidegets(
                          text: "Compartir",
                          icon: Icons.share,
                        ),
                        ItemVideoDetailWidegets(
                          text: "Crear",
                          icon: Icons.play_arrow_rounded,
                        ),
                        ItemVideoDetailWidegets(
                          text: "Descargar",
                          icon: Icons.download_outlined,
                        ),
                        ItemVideoDetailWidegets(
                          text: "Compartir",
                          icon: Icons.share,
                        ),
                        ItemVideoDetailWidegets(
                          text: "Crear",
                          icon: Icons.play_arrow_rounded,
                        ),
                        ItemVideoDetailWidegets(
                          text: "Descargar",
                          icon: Icons.download_outlined,
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: Colors.white24,
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChannelPage(),
                      ),
                    );
                  },
                  leading: CircleAvatar(
                    backgroundColor: Colors.white24,
                    backgroundImage: NetworkImage(
                      "https://images.pexels.com/photos/598917/pexels-photo-598917.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    ),
                  ),
                  title: Text(
                    "ScuevaR",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                  subtitle: Text(
                    "3.85 M de suscriptores",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12.0,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "SUSCRITO",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Icon(
                        Icons.notifications_none,
                        color: Colors.white70,
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.white24,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: videos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ItemVideoWidgets(
                        videoModel: videos[index],
                      );
                    })
              ],
            ),
          ))
        ],
      ),
    );
  }
}
