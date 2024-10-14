import 'package:flutter/material.dart';

class HouseMaidDashboardTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            // Top section with Logo, Avatar, and Badge (Fixed)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Top Row with Logo and Avatar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Logo on the Left
                      Image.asset(
                        'assets/images/logo.png', // Replace with actual logo path
                        height: 40,
                      ),
                      // Circular Avatar on the Right
                      CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage('assets/images/profileimage.jpg')),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // Badge Section (Fixed)
                  _buildIconAndLevel(),
                ],
              ),
            ),

            // Scrollable Content Below the Fixed Header
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 16),
                      _buildStatsContainer(),
                      const SizedBox(height: 16),
                      _buildEarningsContainer(),
                      const SizedBox(height: 16),
                      _buildAdditionalInfoContainer(),
                      const SizedBox(height: 16),
                      _buildNewSection(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Badge Section
  Widget _buildIconAndLevel() {
    return Column(
      children: [
        Image.asset(
          'assets/images/badge.png', // Replace with your badge image path
          height: 100,
          width: 100,
        ),
        const SizedBox(height: 8),
        const Text(
          'Level 5',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  // Stats Container
  Widget _buildStatsContainer() {
    return _buildSectionContainer(
      children: [
        _buildBoldInfoRow('Orders', 40, 20),
        _buildBoldInfoRow('Unique Clients', 15, 20),
        _buildBoldInfoRow('Earnings', 2200.00, 3000.00, isCurrency: true),
        _buildInfoRow('Avg. Response Rate', 'Minimum 1 hour', highlight: true),
        _buildInfoRow('Ratings', '4.7/4.5'),
      ],
    );
  }

  // Earnings Container
  Widget _buildEarningsContainer() {
    return _buildSectionContainer(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Earnings (Last 30 days)',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Details',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFFFEB0D9),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Additional Info Container
  Widget _buildAdditionalInfoContainer() {
    return _buildSectionContainer(
      children: [
        _buildInfoRow('Earning in August', '\$200'),
        _buildInfoRow('Avg. Selling Price', '\$100'),
        _buildInfoRow('Active tasks', '2 (\$200)'),
        _buildInfoRow('Available for withdrawal', '\$200'),
      ],
    );
  }

  // New Section Below Additional Info
  Widget _buildNewSection() {
    return _buildSectionContainer(
      children: [
        _buildInfoRow('Completed Orders', '100'),
        _buildInfoRow('Pending Orders', '5'),
        _buildInfoRow('Total Earnings', '\$10,000'),
      ],
    );
  }

  // Helper: Section Container with Shadow
  Widget _buildSectionContainer({required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  // Helper: Row with Bold Stats
  Widget _buildBoldInfoRow(String title, num currentValue, num totalValue,
      {bool isCurrency = false}) {
    String formattedCurrent = isCurrency
        ? '\$${currentValue.toStringAsFixed(2)}'
        : currentValue.toString();
    String formattedTotal = isCurrency
        ? '\$${totalValue.toStringAsFixed(2)}'
        : totalValue.toString();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: formattedCurrent,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                TextSpan(
                  text: '/$formattedTotal',
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper: Info Row
  Widget _buildInfoRow(String title, String value, {bool highlight = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: highlight ? FontWeight.bold : FontWeight.normal,
              color: highlight ? Color(0xFFFEB0D9) : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// class HouseMaidDashboardTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: NestedScrollView(
//           headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//             return [
//               SliverAppBar(
//                 backgroundColor: Colors.white,
//                 elevation: 0,
//                 pinned: true, // Keep the top section fixed
//                 flexibleSpace: FlexibleSpaceBar(
//                   background: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         // Top Row with Logo and Avatar
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             // Logo/Icon on the Left
//                             Image.asset(
//                               'assets/images/logo.png', // Replace with actual logo path
//                               height: 40,
//                             ),
//                             // Circular Avatar on the Right
//                             CircleAvatar(
//                               radius: 20,
//                               backgroundImage: NetworkImage(
//                                 'https://via.placeholder.com/150', // Replace with actual image URL
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 25), // Spacing before badge

//                         // Badge and Level Section
//                         _buildIconAndLevel(),
//                       ],
//                     ),
//                   ),
//                 ),
//                 expandedHeight: 300, // Adjust height as needed
//               ),
//             ];
//           },
//           // Scrollable content starts here
//           body: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   const SizedBox(height: 16),
//                   _buildStatsContainer(),
//                   const SizedBox(height: 16),
//                   _buildEarningsContainer(),
//                   const SizedBox(height: 16),
//                   _buildAdditionalInfoContainer(),
//                   const SizedBox(height: 16),
//                   _buildNewSection(),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // Badge and Level Section
//   Widget _buildIconAndLevel() {
//     return Column(
//       children: [
//         Image.asset(
//           'assets/images/badge.png', // Replace with actual badge path
//           height: 100,
//           width: 100,
//         ),
//         const SizedBox(height: 8),
//         const Text(
//           'Level 5',
//           style: TextStyle(
//             fontSize: 28,
//             fontWeight: FontWeight.bold,
//             color: Colors.black87,
//           ),
//         ),
//       ],
//     );
//   }

//   // Stats Container
//   Widget _buildStatsContainer() {
//     return _buildSectionContainer(
//       children: [
//         _buildBoldInfoRow('Orders', 40, 20),
//         _buildBoldInfoRow('Unique Clients', 15, 20),
//         _buildBoldInfoRow('Earnings', 2200.00, 3000.00, isCurrency: true),
//         _buildInfoRow('Avg. Response Rate', 'Minimum 1 hour', highlight: true),
//         _buildInfoRow('Ratings', '4.7/4.5'),
//       ],
//     );
//   }

//   Widget _buildEarningsContainer() {
//     return _buildSectionContainer(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: const [
//             Text(
//               'Earnings (Last 30 days)',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Text(
//               'Details',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Color(0xFFFEB0D9),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildAdditionalInfoContainer() {
//     return _buildSectionContainer(
//       children: [
//         _buildInfoRow('Earning in August', '\$200'),
//         _buildInfoRow('Avg. Selling Price', '\$100'),
//         _buildInfoRow('Active tasks', '2 (\$200)'),
//         _buildInfoRow('Available for withdrawal', '\$200'),
//       ],
//     );
//   }

//   Widget _buildNewSection() {
//     return _buildSectionContainer(
//       children: [
//         _buildInfoRow('Completed Orders', '100'),
//         _buildInfoRow('Pending Orders', '5'),
//         _buildInfoRow('Total Earnings', '\$10,000'),
//       ],
//     );
//   }

//   // Helper: Section Container with Padding and Shadow
//   Widget _buildSectionContainer({required List<Widget> children}) {
//     return Container(
//       padding: const EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.shade200,
//             blurRadius: 8,
//             spreadRadius: 2,
//           ),
//         ],
//       ),
//       child: Column(children: children),
//     );
//   }

//   // Helper: Bold Info Row
//   Widget _buildBoldInfoRow(String title, num currentValue, num totalValue,
//       {bool isCurrency = false}) {
//     String formattedCurrent = isCurrency
//         ? '\$${currentValue.toStringAsFixed(2)}'
//         : currentValue.toString();
//     String formattedTotal = isCurrency
//         ? '\$${totalValue.toStringAsFixed(2)}'
//         : totalValue.toString();

//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(fontSize: 16, color: Colors.black87),
//           ),
//           RichText(
//             text: TextSpan(
//               children: [
//                 TextSpan(
//                   text: formattedCurrent,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                     color: Colors.black87,
//                   ),
//                 ),
//                 TextSpan(
//                   text: '/$formattedTotal',
//                   style: const TextStyle(
//                     fontWeight: FontWeight.normal,
//                     fontSize: 16,
//                     color: Colors.black54,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Helper: Info Row
//   Widget _buildInfoRow(String title, String value, {bool highlight = false}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(fontSize: 16, color: Colors.black87),
//           ),
//           Text(
//             value,
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: highlight ? FontWeight.bold : FontWeight.normal,
//               color: highlight ? Color(0xFFFEB0D9) : Colors.black87,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
