import 'package:app_submission_flutter_pemula/utils/themes.dart';
import 'package:app_submission_flutter_pemula/utils/toast_custom.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HeaderHomeWidget extends StatefulWidget {
  const HeaderHomeWidget({Key? key}) : super(key: key);

  @override
  State<HeaderHomeWidget> createState() => _HeaderHomeWidgetState();
}

class _HeaderHomeWidgetState extends State<HeaderHomeWidget> {
  FToast fToast = FToast();

  @override
  void initState() {
    fToast = FToast();
    fToast.init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(10).copyWith(right: 16),
      leading: CircleAvatar(
        backgroundColor: secondaryColor,
        backgroundImage: const NetworkImage(
          'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        ),
        onBackgroundImageError: (exception, stackTrace) =>
            Text('NN', style: regularTextStyle),
      ),
      title: SizedBox(
        height: 46,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome Back!',
              style: secondaryTextStyle.copyWith(fontSize: 14),
            ),
            const SizedBox(
              height: 1,
            ),
            Expanded(
              child: Text(
                'Arnan A Theopilus',
                overflow: TextOverflow.clip,
                style: regularBoldTextStyle.copyWith(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
      trailing: Wrap(
        children: [
          ComponentButtonHeader(
            iconButton: Icons.search,
            onTap: () => showToast('You clicked search field'),
          ),
          const SizedBox(
            width: 14,
          ),
          Stack(
            children: [
              ComponentButtonHeader(
                iconButton: Icons.notifications,
                onTap: () => showToast('You clicked notification'),
              ),
              Positioned(
                right: 3,
                top: 1,
                child: Container(
                  height: 8,
                  width: 8,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  showToast(String message) {
    fToast.showToast(
      child: toast(message),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 1),
    );
  }
}

class ComponentButtonHeader extends StatelessWidget {
  final void Function() onTap;
  final IconData iconButton;

  const ComponentButtonHeader(
      {Key? key, required this.iconButton, required this.onTap})
      : super(key: key);

  BoxDecoration get boxDecoration => BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 16,
              spreadRadius: 0,
              offset: const Offset(0, 0)),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: boxDecoration,
        child: Icon(iconButton, color: Colors.black),
      ),
    );
  }
}
