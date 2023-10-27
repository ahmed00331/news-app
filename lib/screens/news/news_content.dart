import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/NewsResponse/Articles.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsContent extends StatelessWidget {
  static const String routeName = "news_content";

  NewsContent({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Articles;
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("assets/images/pattern.png"),
            fit: BoxFit.fill,
          )),
      child: Scaffold(
        appBar: AppBar(
          title: Text("${args.source!.name}",
              style: const TextStyle(color: Colors.white)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: CachedNetworkImage(
                imageUrl: args.urlToImage ?? "",
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress)),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              args.title ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Color(0xff4F5A69),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              args.description ?? '',
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              args.publishedAt?.substring(0, 10) ?? "",
              style: const TextStyle(
                color: Color(0xff4F5A69),
              ),
              textAlign: TextAlign.end,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              args.content ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Color(0xff4F5A69),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: TextButton.icon(
                      onPressed: () {
                        openUrl(args.url);
                      },
                      label: Icon(Icons.navigate_next_outlined),
                      icon: const Text("See The Hole Article"),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  void openUrl(String? url) async {
    if (url == null) {
      return;
    }
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
