import 'package:admin/general_binding.dart';
import 'package:admin/routes/app_routes.dart';
import 'package:admin/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'utils/constants/text_strings.dart';
import 'utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.light,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      getPages: TAppRoute.pages,
      initialBinding: GeneralBindings(),
      initialRoute: TRoutes.dashboard,
      unknownRoute: GetPage(
          name: '/page-not-found',
          page: () => const Scaffold(
                body: Center(
                  child: Text('Page Not Found'),
                ),
              )),

      // debugShowCheckedModeBanner: false,
      // scrollBehavior: MyCustomScrollBehavior(),
      // home: const FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Simple Navigation: Default Flutter Navigator VS GetX Navigation',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SecondScreen(),
                      ),
                    );
                  },
                  child: const Text('Default Navigation'),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const SecondScreen()),
                  child: const Text('GetX Navigation'),
                ),
              ),

              //Named Navigation
              const SizedBox(height: 50),
              Divider(),
              const Text(
                'Named Navigation: Flutter Navigator VS GetX Named Navigation',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/second-screen');
                  },
                  child: const Text('Default Named Navigation'),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/second-screen');
                  },
                  child: const Text('GetX Named Navigation'),
                ),
              ),
              const SizedBox(height: 50),

              /// PASS DATA
              const Text(
                'Pass Data between screens - GetX',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/second-screen',
                        arguments: 'GetX is fun with Cwt 🔥');
                  },
                  child: const Text('GetX Pass Data'),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/second-screen?device=phone&id=354&name=Enzo');
                  },
                  child: const Text('Pass Data in URL'),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/second-screen/1234');
                  },
                  child: const Text('Pass Data in URL'),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 400,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(
                      '/second-screen?device=phone&id=354&name=Enzo',
                      arguments: 'GetX is fun with Cwt',
                    );
                  },
                  child: const Text('Pass Data in URL with arguments'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(Get.arguments ?? ''),
            Text('Device = ${Get.parameters['device'] ?? ''}'),
            Text('ID = ${Get.parameters['id'] ?? ''}'),
            Text('Name = ${Get.parameters['name'] ?? ''}'),
            Text('Name = ${Get.parameters['userID'] ?? ''}'),
          ],
        ),
      ),
    );
  }
}
