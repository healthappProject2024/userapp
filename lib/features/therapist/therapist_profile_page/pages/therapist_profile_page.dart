import 'package:flutter/material.dart';
import 'package:userapp/utils/resources/widgets/common_appbar.dart';

class TherapistProfilePage extends StatelessWidget {
  const TherapistProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(title: "Profile"),
    );
  }
}