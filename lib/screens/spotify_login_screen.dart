// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_web_auth/flutter_web_auth.dart';
// import 'package:http/http.dart' as http;
// import 'package:url_launcher/url_launcher.dart';
//
// class SpotifyLoginScreen extends StatefulWidget {
//   @override
//   _SpotifyLoginScreenState createState() => _SpotifyLoginScreenState();
// }
//
// class _SpotifyLoginScreenState extends State<SpotifyLoginScreen> {
//   String? _accessToken;
//   List _tracks = [];
//
//   final clientId = '118201843e1f43adb8c8658c9bbbb860'; // 👈 Replace with your real client ID
//   final redirectUri = 'spotifycloneapp.com://callback';
//
//   Future<void> _authenticate() async {
//     final authUrl =
//         'https://accounts.spotify.com/authorize?client_id=$clientId&response_type=token&redirect_uri=$redirectUri&scope=user-read-private';
//
//     final result = await FlutterWebAuth.authenticate(
//       url: authUrl,
//       callbackUrlScheme: 'spotifycloneapp.com',
//     );
//
//     final token = Uri.parse(result)
//         .fragment
//         .split('&')
//         .firstWhere((e) => e.startsWith('access_token='))
//         .split('=')[1];
//
//     setState(() => _accessToken = token);
//     await _getArijitSongs();
//   }
//
//   Future<void> _getArijitSongs() async {
//     final response = await http.get(
//       Uri.parse('https://api.spotify.com/v1/search?q=arijit%20singh&type=track&limit=10'),
//       headers: {'Authorization': 'Bearer $_accessToken'},
//     );
//
//     final json = jsonDecode(response.body);
//     setState(() {
//       _tracks = json['tracks']['items'];
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Spotify Clone - Arijit Songs")),
//       body: _accessToken == null
//           ? Center(
//         child: ElevatedButton(
//           child: Text("Login with Spotify"),
//           onPressed: _authenticate,
//         ),
//       )
//           : ListView.builder(
//         itemCount: _tracks.length,
//         itemBuilder: (context, index) {
//           final track = _tracks[index];
//           final name = track['name'];
//           final previewUrl = track['preview_url'];
//           final image = track['album']['images'][0]['url'];
//           final openUrl = track['external_urls']['spotify'];
//
//           return ListTile(
//             leading: Image.network(image, width: 50),
//             title: Text(name),
//             subtitle: Text("Tap to open in Spotify"),
//             onTap: () => launchUrl(Uri.parse(openUrl), mode: LaunchMode.externalApplication),
//           );
//         },
//       ),
//     );
//   }
// }