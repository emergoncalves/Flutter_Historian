import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';
import 'package:system_tray/system_tray.dart';

import './theme.dart';
import './features/settings/pages/settings_pag.dart';
import './features/clipboard/pages/clipboard_page.dart';
import './features/clipboard/provider/clipboard_provider.dart';
import './features/settings/provider/setting_page_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  WindowManager.instance.setTitle('Historian');
  WindowManager.instance.setMinimumSize(const Size(400, 600));
  WindowManager.instance.setMaximumSize(const Size(400, 600));
  // WindowManager.instance.setSkipTaskbar(true); // breaks app in windows
  WindowManager.instance.focus();
  WindowManager.instance.setAlwaysOnTop(true);
  runApp(const Historian());
}

class Historian extends StatefulWidget {
  const Historian({super.key});

  @override
  State<Historian> createState() => _HistorianState();
}

class _HistorianState extends State<Historian> {
  @override
  void initState() {
    super.initState();

    initSystemTray();
  }

  Future<String> get lastCopy async {
    final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
    return clipboardData?.text ?? '';
  }

  Future<void> initSystemTray() async {
    String path = Platform.isWindows
        ? 'assets/icons/app_icon.ico'
        : 'assets/icons/app_icon.svg';

    final SystemTray systemTray = SystemTray();

    // We first init the systray menu
    await systemTray.initSystemTray(
      title: await lastCopy,
      iconPath: path,
    );

    // create context menu
    final Menu menu = Menu();
    await menu.buildFrom([
      MenuItemLabel(
          label: 'Show',
          onClicked: (menuItem) {
            WindowManager.instance.show();
            WindowManager.instance.focus();
            WindowManager.instance.setAlwaysOnTop(true);
          }),
      MenuItemLabel(
          label: 'Hide',
          onClicked: (menuItem) => WindowManager.instance.hide()),
      MenuSeparator(),
      MenuItemLabel(
          label: 'Exit',
          onClicked: (menuItem) => WindowManager.instance.close()),
    ]);

    // set context menu
    await systemTray.setContextMenu(menu);

    // handle system tray event
    systemTray.registerSystemTrayEventHandler((eventName) {
      debugPrint("eventName: $eventName");
      if (eventName == kSystemTrayEventClick) {
        Platform.isWindows
            ? WindowManager.instance.show()
            : systemTray.popUpContextMenu();
      } else if (eventName == kSystemTrayEventRightClick) {
        Platform.isWindows
            ? systemTray.popUpContextMenu()
            : WindowManager.instance.show();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ClipboardProvider()),
        ChangeNotifierProvider(create: (_) => SettingsPageProvider()),
      ],
      child: MaterialApp(
        title: 'Historian',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        routes: {
          '/': (_) => const ClipboardPage(),
          SettingsPage.pageRoute: (_) => const SettingsPage(),
        },
      ),
    );
  }
}
