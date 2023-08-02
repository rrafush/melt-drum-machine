import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:melt/piano/controller/controller.dart';
import 'package:melt/piano/view/octave/octave.dart';
import 'package:melt/shared/widgets/melt_appbar.dart';

class PianoScreen extends StatefulWidget {
  const PianoScreen({Key? key}) : super(key: key);

  @override
  State<PianoScreen> createState() => _PianoScreenState();
}

class _PianoScreenState extends State<PianoScreen> {
  final Controller _controller = Controller();

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
    _controller.setupMidiPlugin();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MeltAppBar.horizontal(),
      extendBodyBehindAppBar: true,
      body: const SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            // TODO: implement dynamic octaves configured by user
            Octave(
              octave: 4,
            ),
            Octave(
              octave: 5,
            ),
            Octave(
              octave: 6,
            ),
          ],
        ),
      ),
    );
  }
}
