import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_ViewModel/services/socialMedia_sessionManager.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_res/socialMedia_color.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_utils/routes/socialMedia_route_name.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_utils/socialMedia_utils.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_view/dashboard/profile/socialMedia_profile.dart';
import 'package:test_flutter/firebaseSocialMediaApp/socialMedia_view/dashboard/user/socialMedia_userListScreen.dart';
import 'package:toast/toast.dart';

class socialMedia_DashboardScreen extends StatefulWidget {
  const socialMedia_DashboardScreen({super.key});

  @override
  State<socialMedia_DashboardScreen> createState() => _socialMedia_DashboardScreenState();
}

class _socialMedia_DashboardScreenState extends State<socialMedia_DashboardScreen> {

  final controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreen(){
    return [
      Text("Home"),
      Text("Chat"),
      Text("Add"),
      socialMedia_userListScreen(),
      socialMedia_profileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItem() {
    return [
      PersistentBottomNavBarItem(
          icon: Icon(
              Icons.home,
          ),
          activeColorPrimary: AppColors.primaryIconColor,
          inactiveIcon: Icon(
          Icons.home_outlined,
          color: Colors.grey.shade50,
        )
      ),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.chat),
          activeColorPrimary: AppColors.primaryIconColor,
          inactiveIcon: Icon(
            Icons.chat_outlined,
            color: Colors.grey.shade50,
          )
      ),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.add),
          activeColorPrimary: AppColors.primaryIconColor,
          inactiveIcon: Icon(
            Icons.add_outlined,
            color: Colors.grey.shade50,
          )
      ),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.message),
          activeColorPrimary: AppColors.primaryIconColor,
          inactiveIcon: Icon(
            Icons.message_outlined,
            color: Colors.grey.shade50,
          )
      ),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.person),
          activeColorPrimary: AppColors.primaryIconColor,
          inactiveIcon: Icon(
            Icons.person_outline,
            color: Colors.grey.shade50,
          )
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    ToastContext().init(context);

    return PersistentTabView(
        context,
        screens: _buildScreen(),
        items: _navBarItem(),
        controller: controller,
        backgroundColor: AppColors.otpHintColor,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(1),
        ),
        navBarStyle: NavBarStyle.style15,
    );
  }
}
