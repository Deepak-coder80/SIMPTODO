import 'package:flutter/material.dart';
import '../models/task_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isChecked = false;
  List<Task> _dummyData = [
    Task(title: 'Complete this project', isDone: false),
    Task(title: 'Have meals', isDone: false),
    Task(title: 'Study MP', isDone: false),
    Task(title: 'Study CG', isDone: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      backgroundColor: Colors.orange,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 40, top: 40),
            child: const Text(
              'TODOs',
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
              ),
              child: ListView.builder(
                itemCount: _dummyData.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    _dummyData[index].title,
                    style:  TextStyle(
                      decoration:_dummyData[index].isDone ? TextDecoration.lineThrough:null,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  trailing: Checkbox(
                    value: _dummyData[index].isDone,
                    onChanged: (bool? value) {
                      setState(() {
                        _dummyData[index].isDone = value!;

                      });
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
