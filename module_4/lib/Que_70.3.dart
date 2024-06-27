import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioScreenWithURL extends StatefulWidget {
  const AudioScreenWithURL({super.key});

  @override
  State<AudioScreenWithURL> createState() => _AudioScreenWithURLState();
}

class _AudioScreenWithURLState extends State<AudioScreenWithURL> {
  AudioPlayer audioPlayer = AudioPlayer();
  String audiourl =
      "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba-online-audio-converter.com_-1.wav";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            width: 200,
            child: Image.network(
                'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADICAMAAACahl6sAAAAdVBMVEX///8AAADz8/Obm5vf39+vr6/j4+Orq6v39/eXl5cHBwc7OzuHh4dTU1M/Pz+Dg4NjY2MrKyvq6uoYGBi7u7sODg5UVFTPz89oaGhHR0eOjo4sLCzJyclcXFzBwcHZ2dkeHh57e3s1NTWioqIdHR1zc3NFRUVWdAlGAAAEQklEQVR4nO2d6XaqMBRGAQEtDhUVZwG17fs/4gVLhq7bpJgQTFjf/mcWxLMxQggnwfMAAAAAAAAAAAAAANAm3q/95LB5dRja5Jn/4PPVgWgSNh6+P3p1KHosiYe/nrw6Fi3WVMTPXx2LDhPm4d9fHYwOASfi9J8EIrYBEduAiG1ApF9Wx8N0e5f1oTREJvft9HAMtAJsyea7I3UKxZuoixTpd1ezhx7aLmkiLMWHTVlk9dHsley0A/2LKQ1RfNOkLPJJd1toB/oHIQtxLdxIWSRj+8XaocqJuBhXoo1URWJuP9O3+2Puu4QHTVWE+7n9qINgZUCkDRBRACJtgIgCEGmDKyLn2XUk7Xm4IVI8upuJbHzeCZGQjAdfxJU7IXKgJWNh5S6IFKxEfKvhgsidlSTCyl0QeeOKhOMWEFEAIhAxhMMiu2jDDZd0LBJGEVeLSZGoHsNMlnRUsVOR3aP7dSh6ECHfn5IfpUuRvBl9zcj4qDmRHa13KxdZ5TnX/tqJBDStIJ1IRSbnXHfc8cIqDiUi8bb+OKfj8+1EjqxkLBEJ9vUPd9Mbn/9gFY/EIkVzaLPzUyJzVrIXi6xOTYFWCkXCKp6JRVJSUJJG00qEjeuThvubyJYUJPScYEqEKxopisyFIlz3f29aZM9KLp2LjFhJ+VToYcFfd1uJcG190bnIOyvJ2lsE16xqixd2rnNUhJwg6AXKVRE6PkCfc9orEgsfl3neme1ztFskXlZ/gXIm6kVf2T4Hq0V2zQX4JnhAzlJD/ZPNIkFJSkgHUCyS2izC9dF+TytwReTrv6AcFUlZ0e+9FohABCIQgQhEIAIRiEAEIhCBCEQgAhGIQAQiEIEIRCACEYhAxKjIYB69PfMw1OrH0xP6eFowFYXbx42EgakgYYBL4XizWsRb7esUjqMwEZol1ZBNLBWpXWTLQpA0p7XraU7e5Fq1vmzpfOJZTfxjcQ2HRX7y+uTMPkWMpsv2KdJBArMlIjSlnJztOhTh9iuNi3jxpdoweTbJ/9lM7KV5kSr085m7QnWZG0/PiVq58dzCkZLZCv/R6WyF9GdFanDzR4rORZ6aP3LSW7mGzehpWnGXIiu6UhA52wlm9AR5pNOsHpCjVpqYY7Xpb45VFfjjLuZCE7g7nfV2vtUfv/qY9VZ/2zgyNw+xGEdc5w4zQxWAyFBEBrNUAhej24tXDGY5ES8eygIvXrioPyZXSeVuiFSX1uP7XTLHyx2RP4GIAhBpA0QUgEgbIKLAYESMLlzcp4jRpaT7FPEW9KvE3T8nREwut97nmtiel3/fWNxMLIDf4yrlFcFxvriIb/M8DRH2FM/4uvGtUF/Jn9xG9rCSfxv0361gyUvidN52MZrfDjPpfWSPaIjYBURsAyK2MRiRwbxGcDAvduT6TI6/ajPOhtGy2OtoZWPvbhDvSz+bu/0HAQAAAAAAAAAAAAD28g//KHM1hOQ5eAAAAABJRU5ErkJggg=='),
          ),
          ListTile(
              leading: Text('Play the Song'),
              trailing: IconButton(
                  onPressed: () {
                    play();
                  },
                  icon: Icon(Icons.play_arrow))),
          ListTile(
              leading: Text('Pause the Song'),
              trailing: IconButton(
                  onPressed: () {
                    pause();
                  },
                  icon: Icon(Icons.pause))),
        ],
      ),
    );
  }

  void play() async {
    await audioPlayer.play(audiourl);
  }

  void pause() async {
    await audioPlayer.pause();
  }

  void stop() async {
    await audioPlayer.stop();
  }
}
