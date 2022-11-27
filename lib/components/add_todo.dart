import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simptodo/providers/task_provider.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = '';
    return Container(
      color:const  Color(0xff757575),
      child: Container(
        height: 250,
        decoration:const  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          )
        ),
        child: Container(
          margin: const EdgeInsets.only(left: 25,right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Add Todo',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),),
               TextField(
                 onChanged: (value){
                   title = value;
                 },
                decoration: InputDecoration(
                  hintText: 'Enter your task here',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 2,
                    ),
                  ),
                ),

              ),
              ElevatedButton(onPressed: (){
                Provider.of<TaskProvider>(context,listen: false).addTask(title);
                Navigator.pop(context);
              }, child: const Text('Add Todo +',style: TextStyle(
                color: Colors.white,
              ),),),
            ],
          ),
        ),
      ),
    );
  }
}
