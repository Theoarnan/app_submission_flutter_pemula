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
      contentPadding: const EdgeInsets.all(10),
      leading: CircleAvatar(
        backgroundColor: secondaryColor,
        backgroundImage: const NetworkImage(
          'https://thispersondoesnotexist.com/image',
        ),
        onBackgroundImageError: (exception, stackTrace) =>
            Text('NN', style: regularTextStyle),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome Back!',
            style: secondaryTextStyle,
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            'Caroline NW',
            overflow: TextOverflow.clip,
            style: regularTextStyle.copyWith(fontSize: 18),
          ),
        ],
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