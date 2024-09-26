import 'package:flutter/material.dart';
import 'package:frivia/providers/game_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  double? _device_height, _device_width;
  final String dfl;
  HomePage({required this.dfl});
  GamePageProvider? _pageProvider;
  @override
  Widget build(BuildContext context) {
    _device_height = MediaQuery.of(context).size.height;
    _device_width = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (_context) => GamePageProvider(context: context, difficulty: dfl),
      child: _buildUI(),
    );
  }

  Widget _buildUI() {
    return Builder(builder: (_context) {
      _pageProvider = _context.watch<GamePageProvider>();
      if (_pageProvider?.questions != null) {
        return Scaffold(
          body: SafeArea(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: _device_height! * 0.05),
            child: _gameUI(_context),
          )),
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.blue,
          ),
        );
      }
    });
  }

  Widget _gameUI(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _question(context),
        Column(
          children: [
            _true(),
            SizedBox(
              height: _device_height! * 0.01,
            ),
            _false(),
          ],
        ),
      ],
    );
  }

  Widget _question(BuildContext context) {
    return Text(
      _pageProvider!.GetCurrentQues(),
      style: TextStyle(
          fontSize: 25,
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.w400),
    );
  }

  Widget _true() {
    return Container(
      width: double.infinity,
      child: MaterialButton(
        onPressed: () {
          _pageProvider?.answerQues("True");
        },
        color: Colors.green,
        height: _device_height! * 0.10,
        child: const Text(
          "True",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }

  Widget _false() {
    return Container(
      width: double.infinity, // Add this
      child: MaterialButton(
        onPressed: () {
          _pageProvider?.answerQues("False");
        },
        color: Colors.red,
        height: _device_height! * 0.10,
        child: const Text(
          "False",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }
}
