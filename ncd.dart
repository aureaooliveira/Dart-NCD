import 'dart:io';

class Aluno {
  String nome;
  int id;
  int idade;
  String curso;

  Aluno(this.nome, this.id, this.idade,
      this.curso); //metodo para construir um objeto da classe Aluno

  void exibirInformacoes() {
    print("Nome: $nome");
    print("ID: $id");
    print("Idade: $idade");
    print("Curso: $curso");
  }

  void alteraInformacao(String atributo) {
    atributo = atributo.toLowerCase();
    if (atributo == 'nome') {
      print("Digite o novo nome:");
      this.nome = stdin.readLineSync()!;
    } else if (atributo == 'idade') {
      print("Digite a nova idade:");
      this.idade = int.parse(stdin.readLineSync()!);
    } else if (atributo == 'curso') {
      this.curso = stdin.readLineSync()!;
    } else if (atributo == 'id') {
      print("Não é possível alterar o ID de um aluno.");
    } else {
      print("Atributo nao encontrado!");
    }
  }
}

Aluno lerInformacoes(int ultimoId) {
  print("Digite o nome do aluno: ");
  String nome = stdin.readLineSync()!;
  int id = ultimoId + 1;
  print("Digite a idade: ");
  int idade = int.parse(stdin.readLineSync()!);
  print("Digite o curso em que o aluno está matriculado: ");
  String curso = stdin.readLineSync()!;
  return Aluno(nome, id, idade, curso);
}

bool validaID(int id, List<Aluno> alunos) {
  if (id <= alunos[alunos.length - 1].id) {
    return true;
  } else {
    return false;
  }
}

void PrintMenu() {
  print("--------------------MENU------------------");
  print("1. visualizar alunos já cadastrados");
  print("2. cadastrar novo aluno");
  print("3. remover aluno");
  print("4. alterar um cadastro");
  print("5. sair");
  print("--------------------------------------");
}

void main() {
  var alunos = <Aluno>[
    Aluno("Alan", 0, 20, "Engenharia da Computação"),
    Aluno("Larissa", 1, 22, "Engenharia da computação"),
    Aluno("Aurea", 2, 19, "Ciência da Computação"),
    Aluno("Antônio", 3, 20, "Ciência da Computação")
  ];

  print("\n***Cadastro dos Alunos do projeto NCD***\n");
  var code = 1;

  while (code != 5) {
    PrintMenu();
    print("Digite um numero das opções acima:");
    code = int.parse(stdin.readLineSync()!);

    switch (code) {
      case 1:
        for (var aluno in alunos) {
          aluno.exibirInformacoes();
          print("\n");
        }
        break;

      case 2:
        alunos.add(lerInformacoes(alunos[alunos.length - 1].id));
        break;

      case 3:
        print("Digite o ID do aluno a ser removido:");
        var id = int.parse(stdin.readLineSync()!);

        if (!validaID(id, alunos)) {
          print("Aluno não encontrado!");
          break;
        }
        alunos.removeWhere((aluno) => aluno.id == id);
        print("cadastro removido!\n");
        break;

      case 4:
        print("Digite o ID do aluno que deseja alterar:");
        int id = int.parse(stdin.readLineSync()!);
        if (!validaID(id, alunos)) {
          print("Aluno não encontrado!");
          break;
        }
        print("Digite qual atributo deseja editar:");
        String atributo = stdin.readLineSync()!;
        alunos[id].alteraInformacao(atributo);
        break;

      case 5:
        print("Tchau!");
        break;
    }
  }
}
