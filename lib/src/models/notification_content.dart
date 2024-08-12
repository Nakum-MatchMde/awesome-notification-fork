import '../definitions.dart';
import '../enumerators/notification_layout.dart';
import '../utils/assert_utils.dart';
import 'base_notification_content.dart';

/// Main content of notification
/// If notification has no [body] or [title], it will only be created, but not displayed to the user (background notification).
class NotificationContent extends BaseNotificationContent {
  bool? _hideLargeIconOnExpand;
  int? _progress, _badge, _duration, _playState;
  String? _ticker;
  double? _playbackSpeed;

  NotificationLayout? _notificationLayout;

  bool? _displayOnForeground;
  bool? _displayOnBackground;

  bool? _locked;

  bool? get hideLargeIconOnExpand {
    return _hideLargeIconOnExpand;
  }

  int? get progress {
    return _progress;
  }

  int? get badge {
    return _badge;
  }

  String? get ticker {
    return _ticker;
  }

  NotificationLayout? get notificationLayout {
    return _notificationLayout;
  }

  bool? get displayOnForeground {
    return _displayOnForeground;
  }

  bool? get displayOnBackground {
    return _displayOnBackground;
  }

  bool? get locked {
    return _locked;
  }

  int? get duration {
    return _duration;
  }

  int? get playState {
    return _playState;
  }

  double? get playbackSpeed {
    return _playbackSpeed;
  }

  NotificationContent(
      {required int super.id,
      required String super.channelKey,
      super.title,
      super.body,
      super.groupKey,
      super.summary,
      super.icon,
      super.largeIcon,
      super.bigPicture,
      super.customSound,
      super.showWhen,
      super.wakeUpScreen,
      super.fullScreenIntent,
      super.criticalAlert,
      super.roundedLargeIcon,
      super.roundedBigPicture,
      super.autoDismissible,
      super.color,
      super.timeoutAfter,
      super.chronometer,
      super.backgroundColor,
      super.actionType,
      NotificationLayout notificationLayout = NotificationLayout.Default,
      super.payload,
      super.category,
      bool hideLargeIconOnExpand = false,
      bool locked = false,
      int? progress,
      int? badge,
      String? ticker,
      bool displayOnForeground = true,
      bool displayOnBackground = true,
      int? duration,
      int? playState,
      double? playbackSpeed})
      : _hideLargeIconOnExpand = hideLargeIconOnExpand,
        _progress = progress,
        _ticker = ticker,
        _badge = badge,
        _notificationLayout = notificationLayout,
        _displayOnForeground = displayOnForeground,
        _displayOnBackground = displayOnBackground,
        _locked = locked,
        _duration = duration,
        _playState = playState,
        _playbackSpeed = playbackSpeed;

  @override
  NotificationContent? fromMap(Map<String, dynamic> mapData) {
    super.fromMap(mapData);
    _hideLargeIconOnExpand = AwesomeAssertUtils.extractValue<bool>(
        NOTIFICATION_HIDE_LARGE_ICON_ON_EXPAND, mapData);

    _progress =
        AwesomeAssertUtils.extractValue<int>(NOTIFICATION_PROGRESS, mapData);
    _badge = AwesomeAssertUtils.extractValue<int>(NOTIFICATION_BADGE, mapData);
    _ticker =
        AwesomeAssertUtils.extractValue<String>(NOTIFICATION_TICKER, mapData);
    _locked =
        AwesomeAssertUtils.extractValue<bool>(NOTIFICATION_LOCKED, mapData);
    _duration =
        AwesomeAssertUtils.extractValue<int>(NOTIFICATION_DURATION, mapData);
    _playState =
        AwesomeAssertUtils.extractValue<int>(NOTIFICATION_PLAY_STATE, mapData);
    _playbackSpeed = AwesomeAssertUtils.extractValue<double>(
        NOTIFICATION_PLAYBACK_SPEED, mapData);

    _notificationLayout = AwesomeAssertUtils.extractEnum<NotificationLayout>(
        NOTIFICATION_LAYOUT, mapData, NotificationLayout.values);

    _displayOnForeground = AwesomeAssertUtils.extractValue<bool>(
        NOTIFICATION_DISPLAY_ON_FOREGROUND, mapData);

    _displayOnBackground = AwesomeAssertUtils.extractValue<bool>(
        NOTIFICATION_DISPLAY_ON_BACKGROUND, mapData);

    try {
      validate();
    } catch (e) {
      return null;
    }

    return this;
  }

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> dataMap = super.toMap();

    dataMap = dataMap
      ..addAll({
        NOTIFICATION_HIDE_LARGE_ICON_ON_EXPAND: _hideLargeIconOnExpand,
        NOTIFICATION_PROGRESS: _progress,
        NOTIFICATION_BADGE: _badge,
        NOTIFICATION_TICKER: _ticker,
        NOTIFICATION_LOCKED: _locked,
        NOTIFICATION_LAYOUT: _notificationLayout?.name,
        NOTIFICATION_DISPLAY_ON_FOREGROUND: _displayOnForeground,
        NOTIFICATION_DISPLAY_ON_BACKGROUND: _displayOnBackground,
        NOTIFICATION_DURATION: _duration,
        NOTIFICATION_PLAY_STATE: _playState,
        NOTIFICATION_PLAYBACK_SPEED: _playbackSpeed,
      });
    return dataMap;
  }

  @override
  String toString() {
    return toMap().toString().replaceAll(',', ',\n');
  }
}
