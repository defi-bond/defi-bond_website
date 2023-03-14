
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  void _onTapDownload() {
    const String href = 'https://drive.google.com/uc?export=download&id=1hwnBpdzhnO3OmPtX-aswa_WmgmNYSFsF';
    html.AnchorElement anchorElement = html.AnchorElement(href: href);
    anchorElement.target = '_blank';
    anchorElement.download = 'apk-release.apk';
    anchorElement.click();
  }

  Widget iconLink(final String name, { required final String url }) => InkWell(
    child: Image.asset(
      'icons/$name',
      width: 32.0, height: 32.0,
    ),
    onTap: () => launchUrlString(url),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stake Pool Drops',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'icons/logo.png',
                            width: 128.0, height: 128.0,
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          const Text(
                            'STAKE POOL DROPS',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 32, color: Colors.white),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text(
                              'Winner takes all Stake Pool.',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16, color: Colors.white60),
                            ),
                          ),
                          const SizedBox(
                            height: 32.0,
                          ),
                          TextButton(
                            onPressed: _onTapDownload,
                            style: IconButton.styleFrom(
                              minimumSize: const Size.fromHeight(48.0),
                            ), 
                            child: Image.asset(
                              'icons/android_badge_light.png',
                              height: 48,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      iconLink(
                        'github64.png', 
                        url: 'https://github.com/stakepoollotto/stake_pool_lotto',
                      ),
                      const SizedBox(
                        width: 24.0,
                      ),
                      iconLink(
                        'twitter300.png', 
                        url: 'https://twitter.com/StakePoolDrops',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      }, 
    );
  }
}