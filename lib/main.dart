import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white, // Prevents tint on scroll
          elevation: 1.0,
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130.0), // Increased max height
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: Color(0xFF002c57), width: 1.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 16.0), // Increased vertical padding
            child: SafeArea(
              child: Wrap(
                spacing: 16.0,
                runSpacing: 8.0,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Image.asset(
                    'assets/clinicLogo.png',
                    height: 40, // Adjust height to fit in AppBar
                  ),
                  const Text(
                    'orthoRPM',
                    style: TextStyle(
                      color: Color(0xFF002c57),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.phone, color: Color(0xFF002c57)),
                      SizedBox(width: 8),
                      Text(
                        '030 1234 5678',
                        style: TextStyle(color: Color(0xFF002c57), fontSize: 16),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.location_on, color: Color(0xFF002c57)),
                      SizedBox(width: 8),
                      Text(
                        'Am Treptower Park 1, 12435 Berlin',
                        style: TextStyle(color: Color(0xFF002c57), fontSize: 16),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.email, color: Color(0xFF002c57)),
                      SizedBox(width: 8),
                      Text(
                        'info@orthorpm.de',
                        style: TextStyle(color: Color(0xFF002c57), fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.camera_alt_outlined), // Placeholder for Instagram
                        color: const Color(0xFF002c57),
                        onPressed: () {
                          // TODO: Implement Instagram link
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.facebook),
                        color: const Color(0xFF002c57),
                        onPressed: () {
                          // TODO: Implement Facebook link
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.email),
                        color: const Color(0xFF002c57),
                        onPressed: () {
                          // TODO: Implement Email action
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 768) {
            return _buildMobileLayout();
          } else {
            return _buildDesktopLayout();
          }
        },
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 12.0),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top-Left: Logo
                SizedBox(
                  width: 300, // Constrains the width of the left column
                  child: Image.asset(
                    'assets/firat.png',
                    fit: BoxFit.contain,
                    alignment: Alignment.centerLeft,
                  ),
                ),
                const SizedBox(width: 24),
                // Top-Right: Biography
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Firat Polat',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF002c57),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Dr Tip (Trakya Univ.)',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF002c57),
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Firat Polat is a specialist in Physical and Rehabilitative Medicine with extensive experience from various clinics in Berlin. His work focuses on pain therapy (Schmerztherapie), manual medicine (Manuelle Medizin), and acupuncture (Akupunktur) to help patients regain their mobility and well-being.',
                          style: TextStyle(fontSize: 16, height: 1.5, color: Color(0xFF002c57)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 0.0),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Bottom-Left: Services
                SizedBox(
                  width: 300, // Constrains the width of the left column
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Services Offered',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF002c57),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('• Schmerztherapie', style: TextStyle(color: Color(0xFF002c57), fontSize: 16)),
                      SizedBox(height: 4),
                      Text('• Manuelle Medizin', style: TextStyle(color: Color(0xFF002c57), fontSize: 16)),
                      SizedBox(height: 4),
                      Text('• Akupunktur', style: TextStyle(color: Color(0xFF002c57), fontSize: 16)),
                      SizedBox(height: 4),
                      Text('• Physikalische und Rehabilitative Medizin', style: TextStyle(color: Color(0xFF002c57), fontSize: 16)),
                    ],
                  ),
                ),
                const SizedBox(width: 24),
                // Bottom-Right: Opening Hours
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Opening Hours',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF002c57),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Monday - Friday: 9:00 - 18:00',
                        style: TextStyle(fontSize: 16, color: Color(0xFF002c57)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/firat.png',
              fit: BoxFit.contain,
              alignment: Alignment.centerLeft,
            ),
            const SizedBox(height: 24),
            const Text(
              'Firat Polat',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF002c57),
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Dr Tip (Trakya Univ.)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xFF002c57),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Firat Polat is a specialist in Physical and Rehabilitative Medicine with extensive experience from various clinics in Berlin. His work focuses on pain therapy (Schmerztherapie), manual medicine (Manuelle Medizin), and acupuncture (Akupunktur) to help patients regain their mobility and well-being.',
              style: TextStyle(fontSize: 16, height: 1.5, color: Color(0xFF002c57)),
            ),
            const SizedBox(height: 24),
            const Text(
              'Services Offered',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF002c57),
              ),
            ),
            const SizedBox(height: 8),
            const Text('• Schmerztherapie', style: TextStyle(color: Color(0xFF002c57), fontSize: 16)),
            const SizedBox(height: 4),
            const Text('• Manuelle Medizin', style: TextStyle(color: Color(0xFF002c57), fontSize: 16)),
            const SizedBox(height: 4),
            const Text('• Akupunktur', style: TextStyle(color: Color(0xFF002c57), fontSize: 16)),
            const SizedBox(height: 4),
            const Text('• Physikalische und Rehabilitative Medizin', style: TextStyle(color: Color(0xFF002c57), fontSize: 16)),
            const SizedBox(height: 24),
            const Text(
              'Opening Hours',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF002c57),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Monday - Friday: 9:00 - 18:00',
              style: TextStyle(fontSize: 16, color: Color(0xFF002c57)),
            ),
          ],
        ),
      ),
    );
  }
}
