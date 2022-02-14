import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stopwatch/platform_alert.dart';

class StopWatch extends StatefulWidget {
  static const route = '/stopwatch';
  final String? name;
  final String? email;

  const StopWatch({Key? key, this.name, this.email}) : super(key: key);

  @override
  _StopWatchState createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  int milliseconds = 0;
  late Timer timer;
  late bool isTicking = false;
  final laps = <int>[];
  final itemHeight = 60.0;
  final scrollController = ScrollController();

  void _onTick(Timer time) {
    setState(() {
      milliseconds += 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    Object? name = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(name.toString()),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: _buildCounter(context)),
          Expanded(child: _buildLapDisplay()),
        ],
      ),
    );
  }

  Widget _buildCounter(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Lap ${laps.length + 1}',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(color: Colors.white),
          ),
          Text(
            _secondsText(milliseconds),
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(color: Colors.white),
          ),
          SizedBox(
            height: 20,
          ),
          _buildControls()
        ],
      ),
    );
  }

  Widget _buildControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          child: Text('Start'),
          onPressed: isTicking ? null : _startTimer,
        ),
        SizedBox(
          width: 20,
        ),
        ElevatedButton(
          onPressed: isTicking ? _lap : null,
          child: Text('Lap'),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow)),
        ),
        SizedBox(
          width: 20,
        ),
        Builder(
            builder: (context) => TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: isTicking ? () => _stopTimer(context) : null,
                  child: Text('Stop'),
                )),
      ],
    );
  }

  String _secondsText(int milliseconds) {
    final seconds = milliseconds / 1000;
    return '$seconds seconds';
  }

  void _startTimer() {
    timer = Timer.periodic(Duration(milliseconds: 100), _onTick);

    setState(() {
      milliseconds = 0;
      isTicking = true;
      laps.clear();
    });
  }

  void _stopTimer(BuildContext context) {
    timer.cancel();

    setState(() {
      isTicking = false;
    });

    showBottomSheet(context: context, builder: _buildRunCompleteSheet);
  }

  Widget _buildRunCompleteSheet(BuildContext context) {
    final totalRuntime =
        laps.fold<int>(milliseconds, (total, lap) => total + lap);
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
        child: Container(
      color: Theme.of(context).cardColor,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Run Finished!',
              style: textTheme.headline6,
            ),
            Text('Total Run Time is ${_secondsText(totalRuntime)}.')
          ],
        ),
      ),
    ));
  }

  void _lap() {
    setState(() {
      laps.add(milliseconds);
      milliseconds = 0;
    });

    scrollController.animateTo(itemHeight * laps.length,
        duration: Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  Widget _buildLapDisplay() {
    return Scrollbar(
        child: ListView.builder(
      controller: scrollController,
      itemExtent: itemHeight,
      itemCount: laps.length,
      itemBuilder: (context, index) {
        final milliseconds = laps[index];
        return ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 50),
          title: Text('Lap ${index + 1}'),
          trailing: Text(_secondsText(milliseconds)),
        );
      },
    ));
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
