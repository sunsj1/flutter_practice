import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui/theme.dart';
import 'package:ui/view/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: MeditateThemeData.lightThemeData,
      darkTheme: MeditateThemeData.darkThemeData,
      themeMode: ThemeMode.light,
      routes: {
        '/': (context) => const MyHomePage(), // Default route
        '/tabbed': (context) =>  MyTabbedScreen(), // Tabbed screen route
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.customLinearGradient,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio:
                    16 / 11, // Set the desired aspect ratio (width/height)
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Image.asset(
                      'assets/images/lotus.png', // Replace with your image
                      width: constraints.maxWidth, // Adjust the width
                      height: constraints.maxHeight, // Adjust the height
                    );
                  },
                ),
              ),
              Text(
                'Inner Peace',
                style: GoogleFonts.cookie(
                    textStyle: context.textTheme.displayLarge!
                        .copyWith(color: Colors.white, fontSize: 33)),
              ),
              const SizedBox(
                height: 40,
              ),
              FractionallySizedBox(
                widthFactor: 0.7, // Set to 0.5 for half of the current width
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/tabbed');
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 246, 161, 161),
                          Color.fromARGB(255, 239, 159, 214),
                          Color.fromARGB(255, 228, 138, 206),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Container(
                      constraints: const BoxConstraints(
                        minWidth: 68.0, // Adjust the minimum width if needed
                        minHeight: 36.0,
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'Start Your Journey',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
