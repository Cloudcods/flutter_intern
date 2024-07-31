import 'package:flutter/material.dart';

class GridViewPage extends StatefulWidget {
  const GridViewPage({super.key});

  @override
  State<GridViewPage> createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  final List<String> imageUrls = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYxFdoFnR5zOwGh39kYeU_IfxALlbEOauX0Q&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYxFdoFnR5zOwGh39kYeU_IfxALlbEOauX0Q&s', 
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYxFdoFnR5zOwGh39kYeU_IfxALlbEOauX0Q&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYxFdoFnR5zOwGh39kYeU_IfxALlbEOauX0Q&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYxFdoFnR5zOwGh39kYeU_IfxALlbEOauX0Q&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYxFdoFnR5zOwGh39kYeU_IfxALlbEOauX0Q&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYxFdoFnR5zOwGh39kYeU_IfxALlbEOauX0Q&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYxFdoFnR5zOwGh39kYeU_IfxALlbEOauX0Q&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYxFdoFnR5zOwGh39kYeU_IfxALlbEOauX0Q&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYxFdoFnR5zOwGh39kYeU_IfxALlbEOauX0Q&s',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grid View"),
      ),
      body: GridView.count(
        crossAxisCount: 4,
        children: List.generate(imageUrls.length, (index) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(imageUrls[index]),
                const SizedBox(height: 10),
                Text(
                  'PRACAS $index',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
