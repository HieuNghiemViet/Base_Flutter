import 'package:flutter/material.dart';

class LoadMoreContainer extends StatelessWidget {
  final Function? loadMore;
  final Widget child;

  const LoadMoreContainer({
    super.key,
    this.loadMore,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return NotificationListener<UserScrollNotification>(
      onNotification: (notification) {
        if (notification.metrics.pixels ==
            notification.metrics.maxScrollExtent) {
          loadMore?.call();
        }
        return false;
      },
      child: child,
    );
  }
}
