import 'package:flutter/material.dart';
import 'package:streaming_platform/profile/presentation/widgets/nearly_activity.dart';
import 'package:streaming_platform/profile/presentation/widgets/profile_button.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 15, 23, 42),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 180,
              width: double.infinity,
              child: Image.asset(
                '../lib/images/Firefly.jpg',
                fit: BoxFit.fill,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildIconButton(Icons.arrow_back),
                      _buildIconButton(Icons.settings),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Center(
                  child: Column(
                    children: [
                      Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2,color: Colors.purple),
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 30, 41, 59),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Icon(Icons.photo, size: 54, color: Color.fromARGB(255, 73, 56, 98),),
                        // child: user.photoPath!.isNotEmpty
                        //     ? Image.network(
                        //         user.photoPath![0],
                        //         fit: BoxFit.cover,
                        //       )
                        //     : Image.asset(
                        //         'lib/images/icon-park_down-picture.png',
                        //       ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Petrov Ivan',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '@Petrov',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      SizedBox(height: 32),
                      _buildStatSection(),
                      SizedBox(height: 16),
                      ProfileButton(
                          text: 'Редагувати профіль',
                          icon: Icons.person_outline),
                      ProfileButton(
                          text: 'Дивитися історію', icon: Icons.history),
                      ProfileButton(
                          text: 'Мій список', icon: Icons.view_list_rounded),
                      ProfileButton(
                          text: 'Сповіщення',
                          icon: Icons.notifications_outlined),
                      ProfileButton(
                          text: 'Приватність та безпека',
                          icon: Icons.privacy_tip_outlined),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Недавня активність',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                SizedBox(height: 16),
                NearlyActivityItem('Stranger Things', "Resume watching - Episode 4", '2h ago'),
                SizedBox(height: 8),
                NearlyActivityItem('The Crown', "Added to favorites", '1d ago'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(100),
      ),
      padding: EdgeInsets.all(8),
      child: Icon(icon, color: Colors.white),
    );
  }

  Widget _buildStatSection() {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 30, 41, 59),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem('247', 'Перегляд'),
          _buildStatItem('124', 'Слідкують'),
          _buildStatItem('58', 'Слідкує'),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }
}
