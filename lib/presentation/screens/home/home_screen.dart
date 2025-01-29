import 'package:ezy_course/presentation/screens/create_post/create_post_screen.dart';
import 'package:ezy_course/presentation/screens/home/widgets/post_widget.dart';
import 'package:ezy_course/presentation/screens/home/widgets/social_post.dart';
import 'package:ezy_course/presentation/widgets/bottom_nav_bars/primary_bottom_nav_bar.dart';
import 'package:ezy_course/presentation/widgets/scaffolds/primary_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //     selectedLabelStyle: TextStyle(
      //         color: const Color(AppColors.primaryColor),
      //         fontWeight: FontWeight.w700,
      //         fontSize: 12.sp),
      //     items: const [
      //       BottomNavigationBarItem(
      //           icon: Image(image: AssetImage(AppImages.community)),
      //           label: "Community"),
      //       BottomNavigationBarItem(icon: Icon(Icons.logout), label: "Logout"),
      //     ]),
      bottomNavigationBar: const PrimaryBottomNavBar(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: .025.sh,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const CreatePostScreen()));
                },
                child: const PostWidget()),
            const SocialPost(
                username: 'Amit Aditaya',
                userImage:
                    'https://f.ezycourse.net/2903/cm4167oas0l3foj9n6rucakl8.png',
                timeAgo: '13m ago',
                content:
                    'Hello everyone   this is a post from app to see if attached link is working or not. Here is a link https://www.merriam-webster.com/dictionary/link  but I think this is not working. This should work but not working!!!!',
                imageUrl:
                    'https://f.ezycourse.net/iap/cm3zq2dga00lkpr9nhrof550f.jpg',
                likes: 4,
                comments: 4),
            const SocialPost(
                username: 'Amit Aditaya',
                userImage:
                    'https://f.ezycourse.net/2903/cm4167oas0l3foj9n6rucakl8.png',
                timeAgo: '13m ago',
                content:
                    'Hello everyone   this is a post from app to see if attached link is working or not. Here is a link https://www.merriam-webster.com/dictionary/link  but I think this is not working. This should work but not working!!!!',
                imageUrl:
                    'https://f.ezycourse.net/iap/cm3zq2dga00lkpr9nhrof550f.jpg',
                likes: 4,
                comments: 4)
          ],
        ),
      ),
    );
  }
}
