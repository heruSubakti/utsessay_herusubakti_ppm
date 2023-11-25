import 'package:flutter/material.dart';

//Nama  :Heru Subakti
//Kelas : TI21A
// NIM  : 20210040071
//UTS Pemrograman Perangkat Mobile
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageGallery(),
    );
  }
}

class ImageGallery extends StatefulWidget {
  @override
  _ImageGalleryState createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  List<String> imageUrls = [
    'https://picsum.photos/seed/picsum/200/300',
    'https://picsum.photos/200/300?grayscale',
    'https://picsum.photos/200/300/?blur',
    'https://picsum.photos/id/870/200/300?grayscale&blur=2',
    'https://picsum.photos/id/103/2592/1936',
    'https://picsum.photos/id/28/367/267',
    'https://picsum.photos/id/25/367/267',
    'https://picsum.photos/id/27/367/267',
    'https://picsum.photos/id/45/367/267',
    'https://picsum.photos/id/55/367/267',
    // Tambahkan URL gambar selanjutnya sesuai kebutuhan
  ];

  int currentIndex = 0;

  void goToFirst() {
    setState(() {
      currentIndex = 0;
    });
  }

  void goToPrevious() {
    setState(() {
      currentIndex = (currentIndex > 0) ? currentIndex - 1 : 0;
    });
  }

  void goToNext() {
    setState(() {
      currentIndex = (currentIndex < imageUrls.length - 1)
          ? currentIndex + 1
          : currentIndex;
    });
  }

  void goToLast() {
    setState(() {
      currentIndex = imageUrls.length - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Gallery'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              imageUrls[currentIndex],
              height: 200,
              width: 200,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: goToFirst,
                  child: Text('First'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: goToPrevious,
                  child: Text('Previous'),
                ),
                SizedBox(width: 10),
                ElevatedButton(onPressed: goToNext, child: Text('Next')),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: goToLast,
                  child: Text('Last'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
