import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../components/components.dart';
import '../controllers/controllers.dart';
import '../providers/providers.dart';
import '../utils/utils.dart';
import 'screens.dart';


class ConversationScreen extends StatefulWidget {
  const ConversationScreen({super.key});

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    NotificationController().updateToken();
    NotificationController().handleForeground();
    NotificationController().setupInteractedMessage();
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    Logger().f(state);
    if (state == AppLifecycleState.resumed) {
      Provider.of<UserProvider>(context, listen: false)
          .updateOnlineStatus(true, context);
    } else {
      Provider.of<UserProvider>(context, listen: false)
          .updateOnlineStatus(false, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [Header(), ConversationList()],
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CustomNavigation.nextPage(context, const UsersScreen());
        },
        child: const Icon(Icons.people),
      ),
    );
  }
}