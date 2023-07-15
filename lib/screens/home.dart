import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stories/flutter_stories.dart';
import 'package:google_fonts/google_fonts.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _momentCount = 5;
  final _momentDuration = const Duration(seconds: 5);

  @override
  Widget build(BuildContext context) {
    final images = List.generate(
      _momentCount,
          (idx) => Image.asset('assets/images/${idx + 1}.jpg'),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        // leading: Padding(
        //   padding: EdgeInsets.all(8.0),
        //   child: CircleAvatar(
        //     backgroundImage: AssetImage('path_to_your_image'),
        //   ),
        // ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
            'Welcome',
            style: GoogleFonts.dancingScript(
                        fontSize: 27.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
            IconButton(
              icon: Icon(Icons.notifications_none_outlined,color: Colors.grey,),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10.h,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                10,
                    (index) => Container(
                  width: 64.0,
                  height: 64.0,
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.0),
                    border: Border.all(
                      color: CupertinoColors.activeOrange,
                      width: 2.0,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return Container(
                            child: Story(
                              onFlashForward: Navigator.of(context).pop,
                              onFlashBack: Navigator.of(context).pop,
                              momentCount: _momentCount,
                              momentDurationGetter: (idx) => _momentDuration,
                              momentBuilder: (context, idx) => images[idx],
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28.0),
                        color: CupertinoColors.activeBlue,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Divider(
            height: 2.0,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

