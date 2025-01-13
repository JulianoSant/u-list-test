import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:u_list/app/modules/home/home_store.dart';
import 'package:u_list/app/modules/home/models/task_list.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_styles.dart';
import '../../../core/utils/date_formatter.dart';

class ListDetailPage extends StatelessWidget {
  final TaskList list;

  const ListDetailPage({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista: ${list.title}', style: AppTextStyles.title),
        backgroundColor: AppColors.primary,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Excluir Lista', style: AppTextStyles.title),
                  content: const Text(
                    'Tem certeza que deseja excluir esta lista? Esta ação não pode ser desfeita.',
                    style: AppTextStyles.body,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Modular.to.pop(),
                      child: const Text('Cancelar', style: AppTextStyles.body),
                    ),
                    TextButton(
                      onPressed: () {
                        Modular.to.pop();
                        Modular.to.pop();
                        Modular.get<HomeStore>().removeList(list.id);
                      },
                      child: const Text('Excluir', style: AppTextStyles.error),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Observer(
          builder: (_) => list.items.isEmpty
              ? const Center(
                  child: Text(
                    'Nenhum item adicionado ainda. Clique no botão "+" para adicionar.',
                    style: AppTextStyles.subtitle,
                  ),
                )
              : ListView.separated(
                  itemCount: list.items.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (_, index) {
                    final item = list.items[index];
                    return Dismissible(
                      key: Key(item.id),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: AppColors.error,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      onDismissed: (_) {
                        list.removeItem(item.id);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('O item "${item.description}" foi excluído.'),
                          ),
                        );
                      },
                      child: ListTile(
                        leading: Observer(
                          builder: (_) => Checkbox(
                            value: item.isCompleted,
                            onChanged: (_) => item.toggleCompletion(),
                            activeColor: AppColors.secondary,
                          ),
                        ),
                        title: Observer(
                          builder: (_) => Text(
                            item.description,
                            style: TextStyle(
                              decoration: item.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                              color: item.isCompleted ? AppColors.textSecondary : AppColors.textPrimary,
                            ),
                          ),
                        ),
                        subtitle: Text(
                          'Atualizado: ${DateFormatter.format(item.updatedAt)}',
                          style: AppTextStyles.subtitle,
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.edit, color: AppColors.secondary),
                          onPressed: () {
                            final controller = TextEditingController(text: item.description);
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Editar Item', style: AppTextStyles.title),
                                content: TextField(
                                  controller: controller,
                                  decoration: const InputDecoration(hintText: 'Nova descrição'),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      if (controller.text.isNotEmpty) {
                                        item.updateDescription(controller.text);
                                        Modular.to.pop();
                                      }
                                    },
                                    child: const Text('Salvar', style: AppTextStyles.body),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add),
        onPressed: () {
          final controller = TextEditingController();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Novo Item', style: AppTextStyles.title),
              content: TextField(
                controller: controller,
                decoration: const InputDecoration(hintText: 'Descrição do item'),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      list.addItem(controller.text);
                      Modular.to.pop();
                    }
                  },
                  child: const Text('Adicionar', style: AppTextStyles.body),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
