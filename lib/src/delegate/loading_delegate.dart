import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

abstract class LoadingDelegate {
  Widget buildBigImageLoading(BuildContext context, AssetEntity entity, Color themeColor);

  Widget buildPreviewLoading(BuildContext context, AssetEntity entity, Color themeColor);
}

class DefaultLoadingDelegate extends LoadingDelegate {
  @override
  Widget buildBigImageLoading(BuildContext context, AssetEntity entity, Color themeColor) {
    return Center(
      child: CupertinoActivityIndicator(),
    );
  }

  @override
  Widget buildPreviewLoading(BuildContext context, AssetEntity entity, Color themeColor) {
    return Center(
      child: CupertinoActivityIndicator(),
    );
  }
}
