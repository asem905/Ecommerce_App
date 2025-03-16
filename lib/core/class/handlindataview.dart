import 'package:ecommerce/constants/imageasset.dart';
import 'package:ecommerce/core/class/statusrequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class Handlindataview extends StatelessWidget {
  final Statusrequest statusrequest;
  final Widget widget;
  const Handlindataview({super.key, required this.statusrequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusrequest==Statusrequest.loading? Center(child: Lottie.asset(AppImageAsset.loading,width: 250,height: 250),)
    :statusrequest==Statusrequest.offlinefailure? Center(child: Lottie.asset(AppImageAsset.offline_failure,width: 250,height: 250),)
    :statusrequest==Statusrequest.serverfailure ? Center(child: Lottie.asset(AppImageAsset.server_failure,width: 250,height: 250),)
    :statusrequest==Statusrequest.failure? Center(child: Lottie.asset(AppImageAsset.data_failure,width: 250,height: 250),)
    :widget;
  }
}

class HandlinDataRequest extends StatelessWidget {
  final Statusrequest statusrequest;
  final Widget widget;
  const HandlinDataRequest({super.key, required this.statusrequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusrequest==Statusrequest.loading? Center(child: Lottie.asset(AppImageAsset.loading,width: 250,height: 250),)
    :statusrequest==Statusrequest.offlinefailure? Center(child: Lottie.asset(AppImageAsset.offline_failure,width: 250,height: 250),)
    :statusrequest==Statusrequest.serverfailure ? Center(child: Lottie.asset(AppImageAsset.server_failure,width: 250,height: 250),)
    :widget;
  }
}