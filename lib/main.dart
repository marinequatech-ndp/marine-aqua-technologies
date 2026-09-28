import 'package:flutter/material.dart';

void main() {
  runApp(const MarineAquaApp());
}

class MarineAquaApp extends StatelessWidget {
  const MarineAquaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marine Aqua Technologies',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0077B6),
        ),
      ),
      home: const HomePage(),
    );
  }
}

// ======================================================
// PRODUCT MODEL
// ======================================================

class Product {
  final String name;
  final String image;
  final String titleTe;
  final String titleEn;
  final String descriptionTe;
  final String descriptionEn;
  final String dosageTe;
  final String dosageEn;

  const Product({
    required this.name,
    required this.image,
    required this.titleTe,
    required this.titleEn,
    required this.descriptionTe,
    required this.descriptionEn,
    required this.dosageTe,
    required this.dosageEn,
  });
}

// ======================================================
// ALL PRODUCTS
// ======================================================

const List<Product> products = [

  // 1
  Product(
    name: 'Marine 6G',
    image: 'assets/products/marine 6g.png',
    titleTe: 'పొట్టు మారే ప్రక్రియకు ఖనిజాల సహాయం',
    titleEn: 'Liquid Mineral Support for Moulting',
    descriptionTe:
        'Marine 6G లిక్విడ్ మినరల్స్ రొయ్యలు పొట్టు మార్చే సమయంలో అవసరమైన ఖనిజాల అందుబాటును మెరుగుపరచడంలో సహాయపడుతుంది. కొత్త పొట్టు ఏర్పడటం, పొట్టు గట్టిపడటం మరియు పొట్టు మారిన తర్వాత రొయ్యలు త్వరగా కోలుకోవడానికి అవసరమైన ఖనిజ సహాయాన్ని అందిస్తుంది. సరైన ఖనిజ సమతుల్యతతో మౌల్టింగ్ ప్రక్రియ సజావుగా సాగేందుకు మరియు రొయ్యల ఆరోగ్యకరమైన ఎదుగుదలకు తోడ్పడుతుంది.',
    descriptionEn:
        'Marine 6G is a liquid mineral formulation designed to support mineral availability during moulting, new shell formation and shell hardening. It helps maintain mineral balance and supports healthy shrimp growth.',
    dosageTe: 'ఎకరానికి 2 లీటర్లు.',
    dosageEn: '2 Litres per acre.',
  ),

  // 2
  Product(
    name: 'Marine Volt-X',
    image: 'assets/products/marine volt-x.png',
    titleTe: 'వేగవంతమైన ఎదుగుదలకు గ్రోత్ బూస్టర్',
    titleEn: 'Growth Booster for Better Feed Utilization',
    descriptionTe:
        'Marine Volt-X రొయ్యలలో వేగవంతమైన ఎదుగుదల, మెరుగైన ఆహార వినియోగం మరియు ఆరోగ్యకరమైన శరీర అభివృద్ధికి సహాయపడే గ్రోత్ బూస్టర్. ఇందులోని పోషక మరియు ఎంజైమ్ ఆధారిత సహాయం ఆహారం జీర్ణమై పోషకాలు శరీరానికి అందుబాటులోకి రావడానికి తోడ్పడుతుంది.',
    descriptionEn:
        'Marine Volt-X is a growth-support formulation designed to support feed utilization, digestion and healthy shrimp development. It helps improve the availability of nutrients from feed.',
    dosageTe: 'ప్రతి 1 కిలో ఫీడ్‌కు 5 మి.లీ.',
    dosageEn: '5 ml per 1 kg feed.',
  ),

  // 3
  Product(
    name: 'Bio Sludge-X',
    image: 'assets/products/Bio sludge.png',
    titleTe: 'చెరువు అడుగుభాగంలోని స్లడ్జ్ నియంత్రణకు',
    titleEn: 'Sludge Management & Bottom Cleaning',
    descriptionTe:
        'Bio Sludge-X చెరువు అడుగుభాగంలో పేరుకుపోయే స్లడ్జ్ మరియు సేంద్రీయ వ్యర్థాలను విచ్ఛిన్నం చేయడానికి సహాయపడుతుంది. సూక్ష్మజీవులు మరియు ఎంజైమ్ ఆధారిత చర్య ద్వారా స్లడ్జ్‌ను క్రమంగా తగ్గించడంలో సహాయపడుతుంది. సేంద్రీయ వ్యర్థాల ప్రభావాన్ని తగ్గించి చెరువు అడుగుభాగాన్ని మెరుగుపరచడానికి తోడ్పడుతుంది.',
    descriptionEn:
        'Bio Sludge-X helps break down accumulated sludge and organic waste at the pond bottom. Its microbial and enzyme-based action supports sludge degradation and better bottom conditions.',
    dosageTe: 'ఎకరానికి 500 గ్రాములు.',
    dosageEn: '500 g per acre.',
  ),

  // 4
  Product(
    name: 'Marine ProTab',
    image: 'assets/products/marine protab.png',
    titleTe: 'ప్రోబయోటిక్ టాబ్లెట్లు',
    titleEn: 'Probiotic Tablets',
    descriptionTe:
        'Marine ProTab రొయ్యల చెరువులో ఉపయోగకరమైన ప్రోబయోటిక్ సూక్ష్మజీవుల సమతుల్యతను మెరుగుపరచడానికి రూపొందించబడింది. నీటి నాణ్యత, సేంద్రీయ వ్యర్థాల నిర్వహణ మరియు ఆరోగ్యకరమైన చెరువు వాతావరణాన్ని కొనసాగించడంలో సహాయపడుతుంది.',
    descriptionEn:
        'Marine ProTab is a probiotic tablet formulation designed to support beneficial microbial balance, water quality and organic waste management in shrimp ponds.',
    dosageTe: 'ఎకరానికి 500 గ్రాములు.',
    dosageEn: '500 g per acre.',
  ),

  // 5
  Product(
    name: 'Marine Vibrio Shield',
    image: 'assets/products/Marine vibrio shield.png',
    titleTe: 'వైబ్రియో నియంత్రణకు శక్తివంతమైన రక్షణ',
    titleEn: 'Vibrio Management Support',
    descriptionTe:
        'Marine Vibrio Shield రొయ్యల చెరువుల్లో హానికరమైన Vibrio బ్యాక్టీరియా పెరుగుదలను నియంత్రించడానికి రూపొందించిన లిక్విడ్ ఫార్ములేషన్. ఇది చెరువులో సూక్ష్మజీవుల సమతుల్యతను మెరుగుపరచడానికి మరియు రొయ్యల ఆరోగ్యానికి అనుకూలమైన నీటి వాతావరణాన్ని నిర్వహించడానికి సహాయపడుతుంది.',
    descriptionEn:
        'Marine Vibrio Shield is a liquid formulation designed to support management of harmful Vibrio bacteria and maintain a healthier microbial environment in shrimp ponds.',
    dosageTe:
        'ఎకరానికి 1 లీటర్. అప్లికేషన్ తర్వాత 24 గంటల విరామం ఇచ్చి Marine ProTab 500 గ్రాములు/ఎకరం ఉపయోగించాలి.',
    dosageEn:
        '1 Litre per acre. After application, wait 24 hours and then apply Marine ProTab at 500 g per acre.',
  ),

  // 6
  Product(
    name: 'Marine White Shield',
    image: 'assets/products/marine white shield.png',
    titleTe: 'రొయ్యల పేగు ఆరోగ్యానికి ప్రత్యేక ఫార్ములా',
    titleEn: 'Advanced Gut Health Support',
    descriptionTe:
        'Marine White Shield రొయ్యల పేగు ఆరోగ్యాన్ని మెరుగుపరచడానికి రూపొందించిన గట్ హెల్త్ ఫార్ములా. జీర్ణవ్యవస్థ సక్రమంగా పనిచేయడానికి, ఆహారం జీర్ణమయ్యే విధానాన్ని మెరుగుపరచడానికి మరియు ఆరోగ్యకరమైన గట్‌ను కాపాడుకోవడానికి సహాయపడుతుంది.',
    descriptionEn:
        'Marine White Shield is an advanced gut-support formulation designed to support digestion and healthy intestinal function in shrimp.',
    dosageTe: 'ప్రతి 1 కిలో ఫీడ్‌కు 5–10 మి.లీ.',
    dosageEn: '5–10 ml per 1 kg feed.',
  ),

  // 7
  Product(
    name: 'OXYTAB+',
    image: 'assets/products/oxytab plus.png',
    titleTe: 'చెరువులో ఆక్సిజన్ స్థాయిని మెరుగుపరచడానికి',
    titleEn: 'Oxygen Support Tablets',
    descriptionTe:
        'OXYTAB+ చెరువులో కరిగిన ఆక్సిజన్ స్థాయిని మెరుగుపరచడానికి రూపొందించబడింది. తెల్లవారుజామున DO తక్కువగా ఉన్నప్పుడు, మబ్బులు లేదా వర్షపు వాతావరణంలో మరియు అత్యవసర ఆక్సిజన్ అవసరమైన సందర్భాల్లో ఉపయోగించవచ్చు.',
    descriptionEn:
        'OXYTAB+ is designed to support dissolved oxygen availability in pond water, particularly during low-DO conditions and periods of cloudy or rainy weather.',
    dosageTe: 'ఎకరానికి 500 గ్రాములు.',
    dosageEn: '500 g per acre.',
  ),

  // 8
  Product(
    name: 'Free Moult',
    image: 'assets/products/Free moult.png',
    titleTe: 'రొయ్యల పొట్టు మారే ప్రక్రియకు ప్రత్యేక మద్దతు',
    titleEn: 'Moulting Support Formula',
    descriptionTe:
        'Free Moult వనామీ రొయ్యలలో పొట్టు మారే ప్రక్రియకు అవసరమైన ఖనిజాలు, సూక్ష్మ మూలకాలు మరియు సహాయక పోషకాలను అందించడానికి రూపొందించబడింది. కొత్త పొట్టు ఏర్పడటం మరియు పొట్టు గట్టిపడే ప్రక్రియకు తోడ్పడుతుంది.',
    descriptionEn:
        'Free Moult provides mineral, trace-element and nutritional support for moulting, new shell formation and shell hardening in shrimp.',
    dosageTe: 'ఎకరానికి 10 కిలోలు.',
    dosageEn: '10 kg per acre.',
  ),

  // 9
  Product(
    name: 'Red Thunder',
    image: 'assets/products/Red thunder.png',
    titleTe: 'హానికరమైన సూక్ష్మజీవుల నియంత్రణకు',
    titleEn: 'Microbial Management Support',
    descriptionTe:
        'Red Thunder రొయ్యల చెరువుల్లో వైరస్, హానికరమైన బ్యాక్టీరియా, Vibrio మరియు ఫంగస్ వంటి హానికరమైన సూక్ష్మజీవుల ప్రభావాన్ని నిర్వహించడానికి రూపొందించిన ప్రత్యేక ఫార్ములేషన్. చెరువు నీటి పరిశుభ్రతను మెరుగుపరచడంలో సహాయపడుతుంది.',
    descriptionEn:
        'Red Thunder is a specialised formulation designed to support pond hygiene and management of harmful microorganisms including bacteria, Vibrio and fungi.',
    dosageTe: 'ఎకరానికి 1 లీటర్.',
    dosageEn: '1 Litre per acre.',
  ),

  // 10
  Product(
    name: 'Zeoneem',
    image: 'assets/products/Zeoneem.png',
    titleTe: 'చెరువు నీటి నాణ్యత మరియు హానికరమైన గ్యాస్‌ల నియంత్రణకు',
    titleEn: 'Water Quality & Ammonia Management',
    descriptionTe:
        'ZEONEEM Neem Extract, Zeolite మరియు Probiotics కలయికతో రూపొందించిన గ్రాన్యూల్ ఫార్ములేషన్. Zeolite అమోనియా వంటి అవాంఛిత పదార్థాలను నియంత్రించడంలో సహాయపడుతుంది. Probiotics సేంద్రీయ పదార్థాల బయోడిగ్రేడేషన్‌కు తోడ్పడతాయి.',
    descriptionEn:
        'ZEONEEM combines Neem Extract, Zeolite and Probiotics. Zeolite supports adsorption of unwanted compounds such as ammonia, while probiotics support organic matter biodegradation.',
    dosageTe:
        'సాధారణ నిర్వహణ: 5 kg/ఎకరం. అధిక ఆర్గానిక్ లోడ్: 7–8 kg/ఎకరం. అధిక అమోనియా/ఆర్గానిక్ లోడ్: 10 kg/ఎకరం.',
    dosageEn:
        'Normal maintenance: 5 kg/acre. Higher organic load: 7–8 kg/acre. High organic load or ammonia concern: 10 kg/acre.',
  ),

  // 11
  Product(
    name: 'Starmin',
    image: 'assets/products/Starmin.png',
    titleTe: 'అధిక సాంద్రత కలిగిన మినరల్స్ మరియు ప్రోబయోటిక్స్',
    titleEn: 'High-Density Minerals & Probiotics',
    descriptionTe:
        'Starmin రొయ్యల ఆరోగ్యకరమైన ఎదుగుదల, ఖనిజాల సమతుల్యత మరియు చెరువులోని సూక్ష్మజీవుల సమతుల్యతకు సహాయపడే మినరల్స్ మరియు ప్రోబయోటిక్స్ ఆధారిత ఫార్ములేషన్. పొట్టు ఏర్పడటం, మౌల్టింగ్ మరియు మౌల్టింగ్ తర్వాత రికవరీకి మినరల్ సపోర్ట్ అందిస్తుంది.',
    descriptionEn:
        'Starmin is a mineral and probiotic formulation supporting shrimp growth, mineral balance, moulting, shell formation and beneficial microbial balance.',
    dosageTe:
        'చెరువు పరిస్థితి మరియు రొయ్యల పెరుగుదల దశను బట్టి సూచించిన మోతాదులో ఉపయోగించాలి.',
    dosageEn:
        'Use according to the recommended dosage based on pond condition and shrimp growth stage.',
  ),

  // 12
  Product(
    name: 'Nutrimin',
    image: 'assets/products/nutrimin.png',
    titleTe: 'Chelated Minerals ఆధారిత మినరల్ ఫార్ములేషన్',
    titleEn: 'Chelated Mineral Support',
    descriptionTe:
        'Nutrimin రొయ్యలకు సులభంగా అందుబాటులో ఉండే Chelated Minerals ఆధారిత మినరల్ ఫార్ములేషన్. మినరల్ అందుబాటును మెరుగుపరచడం, పొట్టు ఏర్పడటం మరియు గట్టిపడటం, మౌల్టింగ్ మరియు ఆరోగ్యకరమైన ఎదుగుదలకు అవసరమైన మినరల్ సపోర్ట్ అందించడంలో సహాయపడుతుంది.',
    descriptionEn:
        'Nutrimin is a chelated mineral formulation designed to improve mineral availability and support shell formation, moulting and healthy shrimp growth.',
    dosageTe: 'ఎకరానికి 10 కిలోలు.',
    dosageEn: '10 kg per acre.',
  ),

  // 13
  Product(
    name: 'Bio Soil',
    image: 'assets/products/Bio soil.png',
    titleTe: 'చెరువు అడుగు మట్టి నాణ్యతను మెరుగుపరచడానికి',
    titleEn: 'Soil Fertility & Pond Bottom Support',
    descriptionTe:
        'Bio Soil చెరువు బాటమ్ మట్టి నాణ్యతను మెరుగుపరచడానికి మరియు మట్టి సారాన్ని పెంచడానికి రూపొందించిన Soil Fertility Enhancer. సేంద్రీయ వ్యర్థాల నిర్వహణకు మరియు ప్రయోజనకరమైన సూక్ష్మజీవుల కార్యకలాపాలకు అనుకూలమైన వాతావరణం ఏర్పడటానికి సహాయపడుతుంది.',
    descriptionEn:
        'Bio Soil is a soil fertility enhancer designed to support pond bottom quality, organic matter management and beneficial microbial activity.',
    dosageTe: 'ఎకరానికి 10 కిలోలు.',
    dosageEn: '10 kg per acre.',
  ),

  // 14
  Product(
    name: 'Marine Mineral Series',
    image: 'assets/products/chlorides.png',
    titleTe: 'కాల్షియం, మెగ్నీషియం మరియు పొటాషియం మినరల్ సపోర్ట్',
    titleEn: 'Calcium, Magnesium & Potassium Support',
    descriptionTe:
        'Marine Mineral Series లో MARINE MAG+, MARINE POTASH MAX మరియు MARINE CA MAX వంటి మినరల్ ఉత్పత్తులు ఉన్నాయి. ఇవి రొయ్యలలో నీరు–మినరల్ సమతుల్యత, మౌల్టింగ్, కొత్త పొట్టు ఏర్పడటం మరియు ఆరోగ్యకరమైన ఎదుగుదలకు అవసరమైన ఖనిజ సహాయాన్ని అందించడానికి ఉపయోగపడతాయి.',
    descriptionEn:
        'The Marine Mineral Series includes MARINE MAG+, MARINE POTASH MAX and MARINE CA MAX. These products provide mineral support for water-mineral balance, moulting, shell formation and healthy shrimp development.',
    dosageTe:
        'ఉత్పత్తి మరియు చెరువు పరిస్థితిని బట్టి సూచించిన మోతాదులో ఉపయోగించాలి.',
    dosageEn:
        'Use according to the recommended product dosage and pond condition.',
  ),

  // 15
  Product(
    name: 'Yucca Pro',
    image: 'assets/products/Yucca Pro.png',
    titleTe: 'టాక్సిన్లు, అమోనియా మరియు ఆర్గానిక్ లోడ్ నిర్వహణకు',
    titleEn: 'Toxin Binder & Water Quality Support',
    descriptionTe:
        'YUCCAPRO రొయ్యల చెరువుల్లో ఏర్పడే హానికరమైన టాక్సిన్లు, అమోనియా మరియు సేంద్రీయ వ్యర్థాల ప్రభావాన్ని తగ్గించేందుకు ఉపయోగించే టాక్సిన్ బైండర్. నీటి నాణ్యతను మెరుగుపరచడంలో మరియు ఆర్గానిక్ లోడ్‌ను నిర్వహించడంలో సహాయపడుతుంది.',
    descriptionEn:
        'YUCCAPRO is a toxin binder used to support management of toxins, ammonia and organic load in shrimp ponds. It helps maintain a healthier pond environment.',
    dosageTe: 'ఎకరానికి 500 గ్రాములు.',
    dosageEn: '500 g per acre.',
  ),

  // 16
  Product(
    name: 'Hi-Soft',
    image: 'assets/products/Hi-Soft.png',
    titleTe: 'ఆక్వా కల్చర్‌లో నీటి Hardness & Alkalinity',
    titleEn: 'Water Hardness & Alkalinity Management',
    descriptionTe:
        'Hi-Soft నీటిలోని Hardness, Alkalinity మరియు Mineral Balance ను సమతుల్యం చేయడంలో సహాయపడే నీటి నిర్వహణ ఉత్పత్తి. సరైన నీటి సమతుల్యత రొయ్యల ఆరోగ్యం, మౌల్టింగ్ మరియు పెంకు ఏర్పడటానికి సహాయపడుతుంది.',
    descriptionEn:
        'Hi-Soft is a water management product designed to support balance of hardness, alkalinity and minerals in aquaculture water.',
    dosageTe: 'ఎకరానికి 1 కిలో.',
    dosageEn: '1 kg per acre.',
  ),
];

// ======================================================
// HOME PAGE
// ======================================================

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isTelugu = true;
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9FC),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset(
              'assets/products/marine logo.png',
              height: 42,
              errorBuilder: (_, __, ___) {
                return const Icon(
                  Icons.water_drop,
                  color: Color(0xFF0077B6),
                  size: 36,
                );
              },
            ),
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                'MARINE AQUA TECHNOLOGIES',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF005B8F),
                ),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  isTelugu = !isTelugu;
                });
              },
              child: Text(
                isTelugu ? 'EN' : 'తెలుగు',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),

      body: _buildBody(),

      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedTab,
        onDestinationSelected: (index) {
          setState(() {
            selectedTab = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home),
            label: isTelugu ? 'హోమ్' : 'Home',
          ),
          NavigationDestination(
            icon: const Icon(Icons.inventory_2_outlined),
            selectedIcon: const Icon(Icons.inventory_2),
            label: isTelugu ? 'ఉత్పత్తులు' : 'Products',
          ),
          NavigationDestination(
            icon: const Icon(Icons.support_agent_outlined),
            selectedIcon: const Icon(Icons.support_agent),
            label: isTelugu ? 'సపోర్ట్' : 'Support',
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    if (selectedTab == 1) {
      return _productsPage();
    }

    if (selectedTab == 2) {
      return _supportPage();
    }

    return _homeContent();
  }

  // ====================================================
  // HOME CONTENT
  // ====================================================

  Widget _homeContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // HERO
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF005B8F),
                  Color(0xFF0096C7),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 15,
                  color: Colors.black12,
                  offset: Offset(0, 7),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.water_drop,
                  color: Colors.white,
                  size: 45,
                ),
                const SizedBox(height: 15),
                Text(
                  isTelugu
                      ? 'ఆక్వా సాగులో ప్రతి దశలో…'
                      : 'At every stage of aquaculture…',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  isTelugu
                      ? 'మీకు తోడుగా Marine Aqua Technologies'
                      : 'Marine Aqua Technologies is with you',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 20),
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF005B8F),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedTab = 1;
                    });
                  },
                  child: Text(
                    isTelugu
                        ? 'ఉత్పత్తులను చూడండి'
                        : 'View Products',
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          Text(
            isTelugu ? 'మా ఉత్పత్తులు' : 'Our Products',
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: .72,
            ),
            itemBuilder: (context, index) {
              return ProductCard(
                product: products[index],
                isTelugu: isTelugu,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetailPage(
                        product: products[index],
                        isTelugu: isTelugu,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  // ====================================================
  // PRODUCTS PAGE
  // ====================================================

  Widget _productsPage() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              isTelugu
                  ? 'Marine Aqua Products'
                  : 'Marine Aqua Products',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF005B8F),
              ),
            ),
          ),
        ),

        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: products.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: .72,
            ),
            itemBuilder: (context, index) {
              return ProductCard(
                product: products[index],
                isTelugu: isTelugu,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetailPage(
                        product: products[index],
                        isTelugu: isTelugu,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  // ====================================================
  // SUPPORT PAGE
  // ====================================================

  Widget _supportPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 30),

          const Icon(
            Icons.support_agent,
            size: 80,
            color: Color(0xFF0077B6),
          ),

          const SizedBox(height: 20),

          Text(
            isTelugu
                ? 'Marine Aqua Technologies Support'
                : 'Marine Aqua Technologies Support',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          Text(
            isTelugu
                ? 'ఉత్పత్తులు, మోతాదు లేదా ఆక్వా సాగు సంబంధిత సమాచారం కోసం మా సపోర్ట్ టీమ్‌ను సంప్రదించండి.'
                : 'Contact our support team for product information, dosage guidance or aquaculture-related information.',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 30),

          _supportTile(
            Icons.phone,
            isTelugu ? 'ఫోన్ సపోర్ట్' : 'Phone Support',
          ),

          _supportTile(
            Icons.email,
            isTelugu ? 'ఇమెయిల్ సపోర్ట్' : 'Email Support',
          ),

          _supportTile(
            Icons.location_on,
            isTelugu ? 'కార్పొరేట్ ఆఫీస్' : 'Corporate Office',
          ),
        ],
      ),
    );
  }

  Widget _supportTile(IconData icon, String title) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFE0F4FF),
          child: Icon(
            icon,
            color: const Color(0xFF0077B6),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}

// ======================================================
// PRODUCT CARD
// ======================================================

class ProductCard extends StatelessWidget {
  final Product product;
  final bool isTelugu;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.isTelugu,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                color: Colors.white,
                child: Image.asset(
                  product.image,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) {
                    return const Icon(
                      Icons.image_not_supported,
                      size: 55,
                      color: Colors.grey,
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF005B8F),
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    isTelugu
                        ? product.titleTe
                        : product.titleEn,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      height: 1.3,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Row(
                    children: [
                      const Icon(
                        Icons.info_outline,
                        size: 16,
                        color: Color(0xFF0077B6),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        isTelugu ? 'వివరాలు' : 'Details',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ======================================================
// PRODUCT DETAIL PAGE
// ======================================================

class ProductDetailPage extends StatelessWidget {
  final Product product;
  final bool isTelugu;

  const ProductDetailPage({
    super.key,
    required this.product,
    required this.isTelugu,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9FC),

      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // PRODUCT IMAGE
            Container(
              height: 300,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 12,
                    color: Colors.black12,
                  ),
                ],
              ),
              child: Image.asset(
                product.image,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) {
                  return const Icon(
                    Icons.image_not_supported,
                    size: 80,
                    color: Colors.grey,
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            // NAME
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF005B8F),
              ),
            ),

            const SizedBox(height: 10),

            // TITLE
            Text(
              isTelugu
                  ? product.titleTe
                  : product.titleEn,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 25),

            _sectionTitle(
              isTelugu ? 'ఉత్పత్తి వివరాలు' : 'Product Description',
            ),

            const SizedBox(height: 10),

            Text(
              isTelugu
                  ? product.descriptionTe
                  : product.descriptionEn,
              style: const TextStyle(
                fontSize: 16,
                height: 1.6,
              ),
            ),

            const SizedBox(height: 25),

            _sectionTitle(
              isTelugu ? 'మోతాదు' : 'Dosage',
            ),

            const SizedBox(height: 10),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: const Color(0xFFE4F6FF),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.science,
                    color: Color(0xFF0077B6),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      isTelugu
                          ? product.dosageTe
                          : product.dosageEn,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF005B8F),
                    Color(0xFF0096C7),
                  ],
                ),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Text(
                isTelugu
                    ? 'Marine Aqua Technologies\nఆక్వా సాగులో ప్రతి దశలో… మీకు తోడుగా'
                    : 'Marine Aqua Technologies\nYour partner at every stage of aquaculture',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.bold,
        color: Color(0xFF005B8F),
      ),
    );
  }
}
