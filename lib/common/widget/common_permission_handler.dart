import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:menghabit/menghabit.dart';

class PermissionHelper {
  static VoidCallback defaultCall = () {};

  ///检查权限
  static void check(BuildContext context, Permission permission,
      {required VoidCallback onSuccess,
      required VoidCallback onFailed,
      required VoidCallback onOpenSetting}) async {
    bool flag = true;
    // for (var value in permissionList) {
    var status = await permission.status;
    if (!status.isGranted) {
      flag = false;
      // break;
    }
    // }
    if (!flag) {
      PermissionStatus permissionStatus = await requestPermission([permission]);
      if (permissionStatus.isGranted) {
        onSuccess != null ? onSuccess() : defaultCall();
      } else if (permissionStatus.isDenied) {
        onFailed != null ? onFailed() : defaultCall();
      } else if (permissionStatus.isPermanentlyDenied) {
        _showPermissionDialog(
          context,
          () {
            onOpenSetting != null ? onOpenSetting() : defaultCall();
          },
          permission == Permission.camera ? true : false,
        );
      } else if (permissionStatus.isRestricted) {
        //IOS单独处理
        onOpenSetting != null ? onOpenSetting() : defaultCall();
      } else if (permissionStatus.isLimited) {
        //IOS单独处理
        onOpenSetting != null ? onOpenSetting() : defaultCall();
      }
    } else {
      onSuccess != null ? onSuccess() : defaultCall();
    }
  }

  //申请权限
  static Future<PermissionStatus> requestPermission(
      List<Permission> permissionList) async {
    Map<Permission, PermissionStatus> statuses = await permissionList.request();
    PermissionStatus currentPermissionStatus = PermissionStatus.granted;
    statuses.forEach((key, value) {
      if (!value.isGranted) {
        currentPermissionStatus = value;
        return;
      }
    });
    return currentPermissionStatus;
  }
}

void _showPermissionDialog(
    BuildContext context, VoidCallback onOk, bool isCamera) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      content: Text(
        '请在“设置-隐私-照片”选项中，允许访问你的照片',
        style: TextStyle(
          color: Colors.black,
          fontSize: 14.px,
        ),
      ),
      actions: [
        CupertinoDialogAction(
          child: Text(
            '好的',
            style: TextStyle(
              fontSize: 16.px,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        CupertinoDialogAction(
          child: Text(
            '设置',
            style: TextStyle(
              fontSize: 16.px,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
            onOk.call();
          },
        )
      ],
    ),
  );
}
