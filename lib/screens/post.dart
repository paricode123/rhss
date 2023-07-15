import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  File? _image;
  final picker = ImagePicker();
  TextEditingController _topicController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'New Post',
              style: GoogleFonts.poppins(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            TextButton(onPressed: (){

            }, child: Text(
              'Share',
              style: GoogleFonts.poppins(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('path_to_your_image'),
                ),
                SizedBox(width: 15,),
                Expanded(
                  child: TextField(
                    controller: _topicController,
                    decoration: InputDecoration(
                      hintText: 'Write a caption...',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 13
                      )
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                GestureDetector(
                  onTap: () {
                    getImage();
                  },
                  child: Container(
                    width: 90,
                    height: 100,
                    color: Colors.white,
                    child: _image == null
                        ? Icon(
                      Icons.add_photo_alternate,
                      size: 50,
                      color: Colors.grey,
                    )
                        : Image.file(_image!),
                  ),
                ),

              ],
            ),
            SizedBox(height: 20),
            TextField(
              controller: _descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Description',
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 13
                  )
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _topicController,
              decoration: InputDecoration(
                hintText: 'Add Location',
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 13
                  )
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _topicController,
              decoration: InputDecoration(
                hintText: 'Tag People',
                  hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 13
                  )
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
