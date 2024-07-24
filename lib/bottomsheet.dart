import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bottom Sheet',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BottomSheetContent(title: 'Flutter Bottom Sheet'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BottomSheetContent extends StatefulWidget {
  const BottomSheetContent({super.key, required this.title});

  final String title;

  @override
  State<BottomSheetContent> createState() => _BottomSheetPageState();
}

class _BottomSheetPageState extends State<BottomSheetContent> with SingleTickerProviderStateMixin {
  Offset _offset = const Offset(0, 1);
  bool _secondScreen = false;

  @override
  void initState() {
    super.initState();
    _offset = const Offset(0, 1);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _offset = Offset.zero;
      });
    });
  }

  void _finishActivity() {
    SystemNavigator.pop(); // This will finish the Android activity
  }

  void _animateClose() {
    setState(() {
      _offset = const Offset(0, 1);
    });
  }

  @override
  Widget build(BuildContext contenxt) {
    return Stack(
      children: <Widget>[
        GestureDetector(
          onTap: _animateClose,
          child: Container(
            color: Colors.transparent,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedSlide(
            offset: _offset,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            onEnd: () {
              if (_offset.dy == 1) _finishActivity();
            },
            child: BottomSheet(
              enableDrag: true,
              animationController: BottomSheet.createAnimationController(this),
              onClosing: _animateClose,
              builder: (context) {
                return Container(
                  margin: const EdgeInsets.only(
                      top: 64,
                      bottom: 32,
                      left: 24,
                      right: 24
                  ),
                  child: AnimatedCrossFade(
                    duration: const Duration(milliseconds: 300),
                    crossFadeState: _secondScreen
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    firstChild: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'Hello Flutter Bottom Sheet!',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            TextButton(
                                onPressed: () => setState(() => _secondScreen = true),
                                child: const Text("Next")
                            )
                          ],
                        )
                      ]
                    ),
                    secondChild: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'Next Page',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            const Text(
                              'More Text',
                            ),
                            TextButton(
                                onPressed: _animateClose,
                                child: const Text("Close")
                            )
                          ],
                        )
                      ]
                    ),
                  )
                );
              }
            ),
          )
        ),
      ]
    );
  }
}
