import 'package:flutter/material.dart';
import 'package:flutter_osm_interface/flutter_osm_interface.dart';
import 'package:flutter_osm_web/flutter_osm_web.dart';

Widget getWidget({
  required BaseMapController controller,
  required bool trackMyPosition,
  OnGeoPointClicked? onGeoPointClicked,
  OnLocationChanged? onLocationChanged,
  required ValueNotifier<bool> mapIsReadyListener,
  required ValueNotifier<Widget?> dynamicMarkerWidgetNotifier,
  List<StaticPositionGeoPoint> staticPoints = const [],
  Widget? mapIsLoading,
  required List<GlobalKey> globalKeys,
  required Map<String, GlobalKey> staticIconGlobalKeys,
  MarkerOption? markerOption,
  RoadOption? roadConfiguration,
  bool showZoomController = false,
  bool showDefaultInfoWindow = false,
  bool isPicker = false,
  bool showContributorBadgeForOSM = false,
  bool androidHotReloadSupport = false,
  double stepZoom = 1,
  double initZoom = 2,
  double minZoomLevel = 2,
  double maxZoomLevel = 18,
  UserLocationMaker? userLocationMarker,
  Function(bool)? onMapIsReady,
  bool enableRotationByGesture = false,
}) =>
    OsmWebWidget(
      controller: controller,
      staticPoints: staticPoints,
      onGeoPointClicked: onGeoPointClicked,
      onLocationChanged: onLocationChanged,
      mapIsReadyListener: mapIsReadyListener,
      mapIsLoading: mapIsLoading,
      staticIconGlobalKeys: staticIconGlobalKeys,
      globalKeys: globalKeys,
      dynamicMarkerWidgetNotifier: dynamicMarkerWidgetNotifier,
      isPicker: isPicker,
      markerOption: markerOption,
      roadConfiguration: roadConfiguration ?? RoadOption.empty(),
      showDefaultInfoWindow: showDefaultInfoWindow,
      onMapIsReady: onMapIsReady,
      userLocationMarker: userLocationMarker,
      initZoom: initZoom,
      minZoomLevel: minZoomLevel,
      maxZoomLevel: maxZoomLevel,
      stepZoom: stepZoom,
    );
