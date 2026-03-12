import 'package:flutter/material.dart';
import '../services/session_service.dart';

/// A wrapper widget to detect user activity and reset the session timer.
///
/// This widget uses a [Listener] to detect any pointer event (tap, scroll, etc.)
/// and resets the idle timer.
class SessionWrapper extends StatefulWidget {
  final Widget child;

  const SessionWrapper({super.key, required this.child});

  @override
  State<SessionWrapper> createState() => _SessionWrapperState();
}

class _SessionWrapperState extends State<SessionWrapper> {
  final SessionService _sessionService = SessionService();

  @override
  void initState() {
    super.initState();
    // Start initial timer
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _sessionService.resetTimer(context),
    );
  }

  @override
  void dispose() {
    _sessionService.cancelTimer();
    super.dispose();
  }

  void _onUserInteraction() {
    _sessionService.resetTimer(context);
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) => _onUserInteraction(),
      onPointerMove: (_) => _onUserInteraction(),
      onPointerUp: (_) => _onUserInteraction(),
      child: widget.child,
    );
  }
}
