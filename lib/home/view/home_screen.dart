import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:melt/home/view/widget/home_card.dart';
import 'package:melt/navigation/router_path.dart';
import 'package:melt/shared/widgets/keygroove_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.routeObserver,
  });

  final RouteObserver routeObserver;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with RouteAware {
  final _pageController = PageController(
    viewportFraction: 0.8,
    initialPage: 1,
  );
  int _currentPage = 1;
  @override
  void didChangeDependencies() {
    widget.routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
    super.didChangeDependencies();
  }

  @override
  void didPopNext() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.didPopNext();
  }

  String _getLabel(int index) {
    switch (index) {
      case 0:
        return 'Piano';
      case 1:
        return 'Pads';
      case 2:
        return 'Drum Machine';
      default:
        return '';
    }
  }

  String _getImage(int index) {
    switch (index) {
      case 0:
        return 'assets/png/piano.png';
      case 1:
        return 'assets/png/pads.png';
      case 2:
        return 'assets/png/drum.png';
      default:
        return '';
    }
  }

  String _getRoute(int index) {
    switch (index) {
      case 0:
        return RouterPath.piano;
      case 1:
        return RouterPath.samplerPad;
      case 2:
        return RouterPath.beatMaker;
      default:
        return '';
    }
  }

  void _changePage(int page) {
    _currentPage = page;
  }

  Widget _buildAnimatedCard(int index) {
    return HomeCard(
      isCurrent: _currentPage == index,
      assetImage: _getImage(index),
      title: _getLabel(index),
      onTap: () => Navigator.pushNamed(
        context,
        _getRoute(index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KeygrooveAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: kToolbarHeight),
        child: SingleChildScrollView(
          child: SizedBox(
            height: 330,
            child: PageView.builder(
              itemCount: 3,
              onPageChanged: _changePage,
              controller: _pageController,
              itemBuilder: (context, index) {
                return _buildAnimatedCard(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}

// HomeCard(
//   assetImage: 'assets/png/piano.png',
//   title: 'Piano',
//   onTap: () => Navigator.pushNamed(
//     context,
//     RouterPath.piano,
//   ),
// ),
// HomeCard(
//   assetImage: 'assets/png/pads.png',
//   title: 'Pads',
//   onTap: () => Navigator.pushNamed(
//     context,
//     RouterPath.samplerPad,
//   ),
// ),
// HomeCard(
//   assetImage: 'assets/png/drum.png',
//   title: 'Beat Maker',
//   onTap: () => Navigator.pushNamed(
//     context,
//     RouterPath.beatMaker,
//   ),
// ),
