import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:u_list/app/modules/home/home_store.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_styles.dart';
import '../../../core/utils/date_formatter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Modular.get<HomeStore>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Listas', style: AppTextStyles.title),
        backgroundColor: AppColors.primary,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Observer(
          builder: (_) => store.lists.isEmpty
              ? const Center(
                  child: Text(
                    'Nenhuma lista criada ainda. Clique no botão "+" para adicionar.',
                    style: AppTextStyles.subtitle,
                  ),
                )
              : ListView.separated(
                  itemCount: store.lists.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (_, index) {
                    final list = store.lists[index];
                    return ListTile(
                      title: Text(list.title, style: AppTextStyles.body),
                      subtitle: Text(
                        'Criada: ${DateFormatter.format(list.createdAt)}',
                        style: AppTextStyles.subtitle,
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.edit, color: AppColors.secondary),
                        onPressed: () {
                          final controller = TextEditingController(text: list.title);
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text(
                                'Editar Nome da Lista',
                                style: AppTextStyles.title,
                              ),
                              content: TextField(
                                controller: controller,
                                decoration: const InputDecoration(
                                  hintText: 'Novo nome da lista',
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    if (controller.text.isNotEmpty) {
                                      store.updateListTitle(
                                        list.id,
                                        controller.text,
                                      );
                                      Modular.to.pop();
                                    }
                                  },
                                  child: const Text(
                                    'Salvar',
                                    style: AppTextStyles.body,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () => Modular.to.pop(),
                                  child: const Text(
                                    'Cancelar',
                                    style: AppTextStyles.subtitle,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      onTap: () => Modular.to.pushNamed(
                        '/details',
                        arguments: list,
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
              title: const Text('Nova Lista', style: AppTextStyles.title),
              content: TextField(
                controller: controller,
                decoration: const InputDecoration(hintText: 'Título da lista'),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      store.addList(controller.text);
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
