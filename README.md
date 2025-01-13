
# 📋 **U-List - Gerenciador de Listas e Tarefas**

O **U-List** é um aplicativo de gerenciamento de listas e tarefas desenvolvido com **Flutter**, seguindo boas práticas de arquitetura, reatividade com **MobX**, e navegação modular com **Flutter Modular**. O aplicativo permite criar, editar e excluir listas e tarefas, além de gerenciar o status de conclusão das tarefas.

---

## 🚀 **Funcionalidades**

- ✅ Criar, editar e excluir **listas**.
- ✅ Adicionar, editar e excluir **tarefas** dentro das listas.
- ✅ Marcar tarefas como concluídas ou pendentes.

---

## 🛠 **Tecnologias e Ferramentas**

- **Flutter**: 3.19.3
- **Gerenciador de Estado**: MobX
- **Navegação e Injeção de Dependência**: Flutter Modular
- **Estilização Centralizada**:
  - **Cores**: `app_colors.dart`
  - **Estilos de Texto**: `app_text_styles.dart`
- **Formatação de Datas**: `date_formatter.dart`

---

## 📂 **Estrutura do Projeto**

A arquitetura do projeto segue os princípios de **Clean Architecture**, com separação de responsabilidades e modularização.

### Estrutura de Diretórios:
```plaintext
lib/
├── app/
│   ├── modules/
│   │   ├── home/
│   │   │   ├── models/
│   │   │   │   ├── task_item.dart      # Classe que representa uma tarefa.
│   │   │   │   └── task_list.dart      # Classe que representa uma lista.
│   │   │   ├── home_store.dart         # Lógica de estado para o módulo principal.
│   │   │   ├── home_module.dart        # Configuração das dependências e rotas do módulo.
│   │   │   ├── home_page.dart          # Página inicial do app.
│   │   │   ├── widgets/
│   │   │   │   └── list_item_widget.dart # Widget de item reutilizável.
│   │   ├── list_detail/
│   │   │   ├── list_detail_page.dart   # Página de detalhes da lista.
│   ├── app_module.dart                 # Configuração global de rotas e dependências.
│   ├── app_widget.dart                 # Tema e configuração do MaterialApp.
├── core/
│   ├── styles/
│   │   ├── app_colors.dart             # Paleta de cores do app.
│   │   ├── app_text_styles.dart        # Estilos de texto centralizados.
│   ├── utils/
│   │   └── date_formatter.dart         # Utilitário para formatação de datas.
├── main.dart                           # Ponto de entrada do aplicativo.
```

---

## 🖥 **Como Rodar o Projeto**

### Pré-requisitos:
- Flutter versão **3.19.3** ou superior.
- Configuração de um dispositivo/emulador para desenvolvimento.

### Passos:

1. **Clone o Repositório**:
   ```bash
   git clone https://github.com/JulianoSant/u-list-test.git
   cd u_list
   ```

2. **Instale as Dependências**:
   Execute o comando para instalar as dependências do projeto:
   ```bash
   flutter pub get
   ```

3. **Execute o Aplicativo**:
   Inicie o projeto no emulador ou dispositivo físico:
   ```bash
   flutter run
   ```

---

## 📖 **Documentação do Código**

### **1. Módulo Principal (`Home`)**
#### **Arquivos**:
- `home_store.dart`: Gerencia o estado das listas no app.
- `home_page.dart`: Página inicial que exibe todas as listas criadas.
- `task_list.dart`: Define a estrutura de uma lista e suas operações.

#### **Principais Métodos**:
- **Criar Lista**:
  ```dart
  void addList(String title);
  ```
- **Remover Lista**:
  ```dart
  void removeList(String id);
  ```

### **2. Página de Detalhes da Lista**
#### **Arquivos**:
- `list_detail_page.dart`: Página de gerenciamento das tarefas em uma lista.
- `task_item.dart`: Define a estrutura de uma tarefa e suas operações.

#### **Principais Métodos**:
- **Adicionar Tarefa**:
  ```dart
  void addItem(String description);
  ```
- **Remover Tarefa**:
  ```dart
  void removeItem(String itemId);
  ```
- **Marcar Como Concluído**:
  ```dart
  void toggleCompletion();
  ```

---

## 🎨 **Estilização**

O aplicativo utiliza arquivos centralizados para gerenciar estilos e cores:

- **Cores (`app_colors.dart`)**:
  ```dart
  class AppColors {
    static const primary = Colors.blue;
    static const secondary = Colors.blueAccent;
    static const background = Color(0xFFF5F5F5);
    static const textPrimary = Colors.black;
    static const textSecondary = Colors.grey;
    static const error = Colors.red;
  }
  ```

- **Estilos de Texto (`app_text_styles.dart`)**:
  ```dart
  class AppTextStyles {
    static const title = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    static const subtitle = TextStyle(fontSize: 16, color: Colors.grey);
    static const body = TextStyle(fontSize: 14, color: Colors.black);
    static const error = TextStyle(fontSize: 14, color: Colors.red);
  }
  ```

---

## 🧪 **Testando Funcionalidades**

### Testar Criação e Exclusão de Listas:
1. Abra o app e clique no botão "+".
2. Digite o nome da nova lista e clique em "Adicionar".
3. Para excluir, deslize a lista para a esquerda.

### Testar Adição e Edição de Tarefas:
1. Clique em uma lista para abrir a tela de detalhes.
2. Clique no botão "+" para adicionar uma nova tarefa.
3. Clique no checkbox para marcar a tarefa como concluída.
4. Clique no ícone de edição para alterar o nome da tarefa.

---

