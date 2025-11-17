import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_calculator/presentation/Screen/calculator_screen.dart';
import 'package:smart_calculator/presentation/Screen/converter_screen.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _screens = [CalculatorScreen(), ConverterScreen()];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          
          icon: SvgPicture.asset('assets/svg/history.svg'),
          onPressed: () {
            // Add history functionality here
          },
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTabButton('Calculator', 0),
            const SizedBox(width: 24),
            _buildTabButton('Converter', 1),
          ],
        ),
        centerTitle: true,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: _screens,
      ),
    );
  }

  Widget _buildTabButton(String title, int index) {
    final isSelected = _currentIndex == index;

    return GestureDetector(
      onTap: () => _onTabTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            height: 3,
            width: 60,
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFFdfcdfd) : Colors.transparent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }
}
