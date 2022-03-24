import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/internet/internet_enum_errors.dart';

class ContentNoInternet extends StatefulWidget {
  /// The function executed when the refresh button is clicked
  final Function toPageReturn;

  /// The error type to be displayed in the page
  final InternetErrorType errorType;

  const ContentNoInternet({
    Key? key,
    required this.toPageReturn,
    this.errorType = InternetErrorType.client,
  }) : super(key: key);

  @override
  State<ContentNoInternet> createState() => _ContentNoInternetState();
}

class _ContentNoInternetState extends State<ContentNoInternet> {
  late String imagePath;

  late String titleText;

  late String bodyText;

  @override
  void initState() {
    super.initState();
    switch (widget.errorType) {
      case InternetErrorType.client:
        imagePath = "assets/img/no_internet.svg";
        titleText = "user_disconnection_title";
        bodyText = "user_disconnection_subtitle";
        break;
      case InternetErrorType.server:
        imagePath = "assets/img/no_server.svg";
        titleText = "server_disconnection_title";
        bodyText = "server_disconnection_subtitle";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 25, left: 25, right: 25),
          child: Text(
            titleText,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 15),
          child: Text(
            bodyText,
          ),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 5.0, onPrimary: Colors.white),
            child: Text('reload'.tr.capitalizeFirst!),
            onPressed: () {
              widget.toPageReturn();
            })
      ],
    ));
  }
}
