import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gotrip/core/constants.dart';
import 'package:gotrip/widgets/app_bar.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "My Account",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6,
          ),
          SettingItemWidget(
              leading: const Icon(Icons.edit),
              titleTextStyle: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontSize: 18.sp),
              title: "Edit Profile"),
          SettingItemWidget(
              leading: const Icon(Icons.notifications),
              trailing: Switch.adaptive(
                  value: false,
                  activeColor: primaryColor,
                  onChanged: (val) {
                    //Change notification status
                  }),
              titleTextStyle: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontSize: 18.sp),
              title: "Notifications"),
          const Spacer(),
          SettingItemWidget(
              leading: const Icon(
                Icons.exit_to_app_rounded,
                color: Colors.red,
              ),
              titleTextStyle: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.red, fontSize: 18.sp),
              title: "Logout"),
        ],
      ).paddingSymmetric(horizontal: 3.w),
    );
  }
}
