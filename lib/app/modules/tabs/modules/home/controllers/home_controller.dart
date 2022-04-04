import 'dart:convert';
import 'dart:typed_data';

import 'package:cupidum_app/app/models/user/short_user.dart';
import 'package:cupidum_app/app/models/user/user.dart';
import 'package:cupidum_app/app/providers/inwait_provider.dart';
import 'package:cupidum_app/app/providers/match_provider.dart';
import 'package:cupidum_app/app/providers/request_provider.dart';
import 'package:cupidum_app/app/providers/user_provider.dart';
import 'package:cupidum_app/app/routes/app_pages.dart';
import 'package:cupidum_app/globals/controller_template.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:swipable_stack/swipable_stack.dart';

class HomeController extends ControllerTemplate {
  final _provider = UserProvider();
  final _requestProvider = RequestProvider();
  final _matchProvider = MatchProvider();
  final _inWaitProvider = InWaitProvider();

  int listId = 0;

  Uint8List? userImage;
  List<User> userList = [];
  User? user;
  final SwipableStackController actionButton = SwipableStackController();

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  @override
  void refreshContent() {
    change(null, status: RxStatus.loading());
    loadData();
    super.refreshContent();
  }

  void loadData() async {
    await call<User>(
      httpCall: () => _provider.getUser(),
      onSuccess: (user) {
        userImage = base64Decode(user.image);
        this.user = user;
      },
      onCallError: (e) => change(null, status: e),
      onError: (e) => change(null, status: RxStatus.error(e.toString())),
    );

    await call<List<User>>(
      httpCall: () => _provider.findUserMatches(),
      onSuccess: (userList) {
        this.userList = userList;
      },
      onCallError: (e) => change(null, status: e),
      onError: (e) => change(null, status: RxStatus.error(e.toString())),
    );

    change(null, status: RxStatus.success());
  }

  matchSwipeCardAction(int index) async {
    if (index < userList.length) {
      final matchUser = userList[index];
      final shortMatchUser = ShortUser(
        id: matchUser.id,
        uid: matchUser.uid,
        name: matchUser.name,
        lastName: matchUser.lastName,
      );
      final shortUser = ShortUser(
        id: user!.id,
        uid: user!.uid,
        name: user!.name,
        lastName: user!.lastName,
      );
      try {
        final userRequests = await _requestProvider.getUserRequests();
        if (userRequests.contains(shortMatchUser)) {
          userRequests.remove(shortUser);

          var matchInWaitList =
              await _inWaitProvider.getUsersInWait(uid: matchUser.uid);

          matchInWaitList.remove(shortUser);

          await _inWaitProvider.editInWaitList(
            matchInWaitList,
            uid: matchUser.uid,
          );
          await _requestProvider.editUserList(userRequests);
          await _matchProvider.addMatch(matchUser);
          await _matchProvider.addMatch(user!, uid: matchUser.uid);
          Get.toNamed(
            Routes.match_done,
            arguments: {"user": user, "matchUser": matchUser},
          );
        } else {
          await _requestProvider.addRequest(user!, uid: matchUser.uid);
          await _inWaitProvider.addInWait(matchUser);
        }
      } catch (e) {
        if (kDebugMode) {
          print("algo salio mal");
        }
      }
    }
  }
}
