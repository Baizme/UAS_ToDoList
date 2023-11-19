import 'package:flutter/material.dart';
import 'package:flutter_riverpod_todo_app/data/data.dart';
import 'package:flutter_riverpod_todo_app/utils/utils.dart';
import 'package:flutter_riverpod_todo_app/widgets/circle_container.dart';
import 'package:gap/gap.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;

    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleContainer(
            color: task.category.color.withOpacity(0.3),
            child: Icon(
              task.category.icon,
              color: task.category.color,
            ),
          ),
          const Gap(16),
          Text(
            task.title,
            style: style.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(task.time, style: style.titleMedium),
          const Gap(16),
          Visibility(
            visible: !task.isCompleted,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Tugas yang harus diselesaikan pada '),
                Text(task.date),
                Icon(
                  Icons.check_box,
                  color: task.category.color,
                ),
              ],
            ),
          ),
          const Gap(16),
          Divider(
            color: task.category.color,
            thickness: 1.5,
          ),
          const Gap(16),
          Text(
            task.note.isEmpty
                ? 'Tidak ada catatan tambahan untuk tugas ini'
                : task.note,
            style: context.textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          const Gap(16),
          Visibility(
            visible: task.isCompleted,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Tugas selesai'),
                Icon(
                  Icons.check_box,
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
