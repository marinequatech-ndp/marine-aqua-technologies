import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MarineAquaApp());
}

const Color marineBlue = Color(0xFF075078);
const Color accentBlue = Color(0xFF129BCB);
const Color pageBg = Color(0xFFF4FAFD);

class MarineAquaApp extends StatelessWidget {
  const MarineAquaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marine Aqua Technologies',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: pageBg,
        colorScheme: ColorScheme.fromSeed(seedColor: marineBlue),
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/marine_logo.png',
                  width: 170,
                  height: 170,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.water_drop_rounded,
                    size: 120,
                    color: accentBlue,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: marineBlue,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Marine Aqua Technologies',
                  style: TextStyle(fontSize: 18, color: marineBlue),
                ),
                const SizedBox(height: 28),
                const CircularProgressIndicator(color: accentBlue),
              ],
            ),
          ),
        ),
      );
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final mobileController = TextEditingController();

  bool get validMobile => mobileController.text.trim().length == 10;

  @override
  void dispose() {
    mobileController.dispose();
    super.dispose();
  }

  void sendOtp() {
    if (!validMobile) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            OtpScreen(mobileNumber: mobileController.text.trim()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(28, 30, 28, 24),
            child: Column(
              children: [
                Image.asset(
                  'assets/marine_logo.png',
                  width: 140,
                  height: 140,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.water_drop_rounded,
                    size: 100,
                    color: accentBlue,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: marineBlue,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Marine Aqua Technologies',
                  style: TextStyle(fontSize: 17, color: marineBlue),
                ),
                const SizedBox(height: 48),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Enter Your Mobile Number',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: marineBlue,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'We will send a 6-digit OTP to verify\nyour mobile number.',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      height: 1.4,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: mobileController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(
                    counterText: '',
                    hintText: 'Enter 10-digit number',
                    prefixIcon: const Icon(
                      Icons.phone_android,
                      color: accentBlue,
                    ),
                    filled: true,
                    fillColor: const Color(0xFFF8FCFE),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide:
                          const BorderSide(color: Color(0xFFB7E3EF)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide:
                          const BorderSide(color: accentBlue, width: 2),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: validMobile ? sendOtp : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: accentBlue,
                      disabledBackgroundColor: Colors.grey.shade300,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Send OTP  →',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 45),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    LoginFeature(Icons.verified_user, 'Secure\nLogin'),
                    LoginFeature(Icons.eco, 'Trusted by\nAqua Farmers'),
                    LoginFeature(Icons.groups, 'Better\nTogether'),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}

class LoginFeature extends StatelessWidget {
  final IconData icon;
  final String title;

  const LoginFeature(this.icon, this.title, {super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Icon(icon, size: 38, color: const Color(0xFF16A5B8)),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13, color: Colors.grey),
          ),
        ],
      );
}

class OtpScreen extends StatefulWidget {
  final String mobileNumber;

  const OtpScreen({super.key, required this.mobileNumber});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final otpController = TextEditingController();

  bool get validOtp => otpController.text.trim().length == 6;

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  void verifyOtp() {
    if (!validOtp) return;

    // Current project flow: demo OTP.
    // Enter 123456 to open the Home page.
    if (otpController.text.trim() != '123456') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Demo OTP: 123456')),
      );
      return;
    }

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const MainNavigationScreen()),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(28, 18, 28, 24),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back, size: 30),
                  ),
                ),
                Image.asset(
                  'assets/marine_logo.png',
                  width: 115,
                  height: 115,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.water_drop_rounded,
                    size: 90,
                    color: accentBlue,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Verify OTP',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: marineBlue,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Enter the 6-digit OTP sent to\n+91 ${widget.mobileNumber}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: otpController,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 25,
                    letterSpacing: 8,
                    fontWeight: FontWeight.bold,
                  ),
                  onChanged: (_) => setState(() {}),
                  decoration: InputDecoration(
                    counterText: '',
                    hintText: 'Enter 6-digit OTP',
                    filled: true,
                    fillColor: const Color(0xFFF8FCFE),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide:
                          const BorderSide(color: Color(0xFFB7E3EF)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide:
                          const BorderSide(color: accentBlue, width: 2),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: validOtp ? verifyOtp : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: accentBlue,
                      disabledBackgroundColor: Colors.grey.shade300,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Verify OTP  →',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Demo OTP: 123456',
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('OTP resend requested'),
                      ),
                    );
                  },
                  child: const Text(
                    'Resend OTP',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: accentBlue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int currentIndex = 0;

  final pages = const [
    HomeScreen(),
    ProductsScreen(),
    SupportScreen(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: IndexedStack(index: currentIndex, children: pages),
        bottomNavigationBar: NavigationBar(
          height: 72,
          selectedIndex: currentIndex,
          backgroundColor: Colors.white,
          indicatorColor: const Color(0xFFD9F3FC),
          onDestinationSelected: (index) =>
              setState(() => currentIndex = index),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.inventory_2_outlined),
              selectedIcon: Icon(Icons.inventory_2),
              label: 'Products',
            ),
            NavigationDestination(
              icon: Icon(Icons.headset_mic_outlined),
              selectedIcon: Icon(Icons.headset_mic),
              label: 'Support',
            ),
          ],
        ),
      );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: pageBg,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: HomeHeader()),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    const HeroBanner(),
                    const SizedBox(height: 16),
                    const QuickActions(),
                    const SizedBox(height: 18),
                    const WaterQualitySection(),
                    const SizedBox(height: 20),
                    const SuccessStoriesSection(),
                  ]),
                ),
              ),
            ],
          ),
        ),
      );
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 12, 10),
        color: Colors.white,
        child: Row(
          children: [
            Image.asset(
              'assets/marine_logo.png',
              width: 58,
              height: 58,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => const Icon(
                Icons.water_drop_rounded,
                size: 50,
                color: accentBlue,
              ),
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MARINE AQUA',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: marineBlue,
                    ),
                  ),
                  Text(
                    'TECHNOLOGIES',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: marineBlue,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'ఆక్వా సాగులో ప్రతి దశలో... మీకు తోడుగా',
                    style: TextStyle(
                      fontSize: 9.5,
                      fontWeight: FontWeight.bold,
                      color: marineBlue,
                    ),
                  ),
                  Text(
                    'Smart Aquaculture. Better Results.',
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => const AlertDialog(
                    title: Text('Notifications'),
                    content: Text('ప్రస్తుతం కొత్త notifications ఏమీ లేవు.'),
                  ),
                );
              },
              icon: const Icon(
                Icons.notifications_none,
                size: 29,
                color: marineBlue,
              ),
            ),
          ],
        ),
      );
}

class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        height: 275,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: const Color(0xFFEAF7FC),
        ),
        child: Image.asset(
          'assets/hero_banner.png',
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => const Center(
            child: Icon(
              Icons.image_not_supported_outlined,
              size: 55,
              color: Colors.grey,
            ),
          ),
        ),
      );
}

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) => Row(
        children: [
          const Expanded(
            child: ShortcutImageCard(
              image: 'assets/shortcut_card_1_royalla_sagu_guide.png',
              fallbackIcon: Icons.menu_book_rounded,
            ),
          ),
          const SizedBox(width: 9),
          const Expanded(
            child: ShortcutImageCard(
              image: 'assets/shortcut_card_2_biomass_calculator.png',
              fallbackIcon: Icons.calculate_rounded,
            ),
          ),
          const SizedBox(width: 9),
          const Expanded(
            child: ShortcutImageCard(
              image: 'assets/shortcut_card_3_royyala_vyadhulu.png',
              fallbackIcon: Icons.health_and_safety_rounded,
            ),
          ),
          const SizedBox(width: 9),
          const Expanded(
            child: HomeCard(
              icon: Icons.manage_search_rounded,
              title: 'Find Your\nProblems',
              color: Color(0xFFFFF2C9),
            ),
          ),
        ],
      );
}

class ShortcutImageCard extends StatelessWidget {
  final String image;
  final IconData fallbackIcon;

  const ShortcutImageCard({
    super.key,
    required this.image,
    required this.fallbackIcon,
  });

  @override
  Widget build(BuildContext context) => Container(
        height: 145,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
          color: const Color(0xFFEAF7FC),
        ),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Center(
            child: Icon(
              fallbackIcon,
              size: 42,
              color: const Color(0xFF087DB5),
            ),
          ),
        ),
      );
}

class HomeCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const HomeCard({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) => Container(
        height: 145,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(19),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 39, color: const Color(0xFF087DB5)),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13.5,
                height: 1.2,
                color: marineBlue,
              ),
            ),
          ],
        ),
      );
}

class WaterQualitySection extends StatelessWidget {
  const WaterQualitySection({super.key});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFDDF5FF), Color(0xFFF0FAFF)],
          ),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0xFFB5E5FA)),
        ),
        child: Column(
          children: [
            Row(
              children: const [
                Expanded(
                  child: Text(
                    'చెరువు నీటి పరిస్థితులు',
                    style: TextStyle(
                      color: marineBlue,
                      fontSize: 23,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Icon(Icons.edit, color: Color(0xFF0B79B2), size: 20),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: const [
                Expanded(
                  child: ParameterCard(
                    icon: Icons.science_outlined,
                    name: 'pH',
                    value: '7.8',
                    unit: '',
                    range: '6.5 - 8.5',
                  ),
                ),
                SizedBox(width: 7),
                Expanded(
                  child: ParameterCard(
                    icon: Icons.water_outlined,
                    name: 'Salinity',
                    value: '18',
                    unit: 'ppt',
                    range: '10 - 25',
                  ),
                ),
                SizedBox(width: 7),
                Expanded(
                  child: ParameterCard(
                    icon: Icons.air,
                    name: 'DO',
                    value: '5.6',
                    unit: 'mg/L',
                    range: '≥ 5.0',
                  ),
                ),
                SizedBox(width: 7),
                Expanded(
                  child: ParameterCard(
                    icon: Icons.science,
                    name: 'Alkalinity',
                    value: '140',
                    unit: 'ppm',
                    range: '80 - 200',
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}

class ParameterCard extends StatelessWidget {
  final IconData icon;
  final String name;
  final String value;
  final String unit;
  final String range;

  const ParameterCard({
    super.key,
    required this.icon,
    required this.name,
    required this.value,
    required this.unit,
    required this.range,
  });

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 11),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(17),
        ),
        child: Column(
          children: [
            Icon(icon, size: 25, color: const Color(0xFF149AD6)),
            const SizedBox(height: 4),
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: marineBlue,
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: const TextStyle(
                color: marineBlue,
                fontSize: 21,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              unit,
              style: const TextStyle(color: Colors.grey, fontSize: 9),
            ),
            const SizedBox(height: 2),
            Text(
              '($range)',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey, fontSize: 8),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: const Color(0xFFC8F2D5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'సరైనది',
                style: TextStyle(
                  color: Color(0xFF188044),
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
}

class SuccessStoriesSection extends StatelessWidget {
  const SuccessStoriesSection({super.key});

  static const stories = [
    'assets/success_stories/story1.jpg',
    'assets/success_stories/story2.jpg',
    'assets/success_stories/story3.jpg',
    'assets/success_stories/story4.jpg',
  ];

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Expanded(
                child: Text(
                  'మా సక్సెస్ స్టోరీస్',
                  style: TextStyle(
                    color: marineBlue,
                    fontSize: 27,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Text(
                'మరిన్ని చూడండి →',
                style: TextStyle(
                  color: Color(0xFF0877AC),
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 190,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: stories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (_, index) => Container(
                width: 275,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: const Color(0xFFE0EEF5)),
                ),
                child: Image.asset(
                  stories[index],
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const Center(
                    child: Icon(
                      Icons.photo_library_outlined,
                      size: 48,
                      color: Color(0xFF0B79B2),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  static const products = [
    ['Marine 6G', 'assets/products/marine 6g.png'],
    ['Marine Volt-X', 'assets/products/marine volt-x.png'],
    ['Bio Sludge-X', 'assets/products/Bio sludge.png'],
    ['Marine ProTab', 'assets/products/marine protab.png'],
    ['Marine Vibrio Shield', 'assets/products/marine vibrio shield.png'],
    ['Marine White Shield', 'assets/products/marine white shield.png'],
    ['Free Moult', 'assets/products/Free moult.png'],
    ['Red Thunder', 'assets/products/Red thunder.png'],
    ['Starmin', 'assets/products/Starmin.png'],
    ['Yucca Pro', 'assets/products/Yucca Pro.png'],
    ['Zeoneem', 'assets/products/Zeoneem.png'],
    ['Chlorides', 'assets/products/chlorides.png'],
    ['Nutrimin', 'assets/products/nutrimin.png'],
    ['OXYTAB Plus', 'assets/products/oxytab plus.png'],
    ['Bio Soil', 'assets/products/Bio soil.png'],
    ['Hi-Soft', 'assets/products/Hi-Soft.png'],
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: pageBg,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'మా ప్రొడక్ట్స్',
            style: TextStyle(
              color: marineBlue,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(14),
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: .82,
          ),
          itemBuilder: (_, index) => ProductGridCard(
            name: products[index][0],
            image: products[index][1],
          ),
        ),
      );
}

class ProductGridCard extends StatelessWidget {
  final String name;
  final String image;

  const ProductGridCard({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFFE0EEF5)),
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                image,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => const Icon(
                  Icons.inventory_2,
                  size: 70,
                  color: marineBlue,
                ),
              ),
            ),
            const SizedBox(height: 7),
            Text(
              name,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: marineBlue,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              height: 38,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFDFF5FC),
                  foregroundColor: marineBlue,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'View Details',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      );
}

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: pageBg,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'టెక్నికల్ సపోర్ట్',
            style: TextStyle(
              color: marineBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              const SizedBox(height: 15),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Column(
                  children: [
                    Icon(Icons.support_agent, size: 75, color: accentBlue),
                    SizedBox(height: 15),
                    Text(
                      'మా నిపుణుల బృందంతో సంప్రదించండి',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: marineBlue,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'మీ చెరువు నిర్వహణ, రొయ్యల ఆరోగ్యం మరియు '
                      'ప్రొడక్ట్ వినియోగంపై సహాయం కోసం మా Technical '
                      'Support Team ను సంప్రదించండి.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.5,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.phone),
                  label: const Text(
                    'సంప్రదించండి',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accentBlue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.chat, color: marineBlue),
                  label: const Text(
                    'WhatsApp Support',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: marineBlue,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFB7E3EF)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
