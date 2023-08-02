import 'package:flutter/material.dart';
import 'package:melt/sampler_pad/controller/controller.dart';
import 'package:melt/sampler_pad/view/widgets/pad.dart';
import 'package:melt/shared/widgets/keygroove_appbar.dart';

class SamplerPadScreen extends StatefulWidget {
  const SamplerPadScreen({super.key});

  @override
  State<SamplerPadScreen> createState() => _SamplerPadScreenState();
}

class _SamplerPadScreenState extends State<SamplerPadScreen> {
  final Controller _controller = Controller();

  @override
  void initState() {
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
      appBar: const KeygrooveAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) => Pad(
                index: index,
              ),
              itemCount: 12,
            ),
          ),
        ],
      ),
    );
  }
}
