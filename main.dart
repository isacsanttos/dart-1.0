// @dart=2.9

import 'dart:io';

class Alimento {
  String codigo;
  List<String> nome;
  List<String> cientifico;
  String ingles;
  String grupo;
  Alimento(this.codigo, this.nome, this.cientifico, this.ingles, this.grupo);

  @override
  String toString() {
    return "Codigo: ${this.codigo} | Nome: ${this.nome} | Nome Cientifico: ${this.cientifico} | Inglês: ${this.ingles} | Grupo:${this.grupo}";
  }
}

class Industrializado extends Alimento {
  final String marca;

  Industrializado(this.marca, String codigo, List<String> nome,
      List<String> cientifico, String ingles, String grupo)
      : super(codigo, nome, cientifico, ingles, grupo);

  @override
  String toString() {
    return "${super.toString()} | Marca do fabricante: ${this.marca}";
  }
}

class Natural extends Alimento {
  String validade;

  Natural(this.validade, String codigo, List<String> nome,
      List<String> cientifico, String ingles, String grupo)
      : super(codigo, nome, cientifico, ingles, grupo);

  @override
  String toString() {
    return "${super.toString()} | Validade: ${this.validade}";

}


}

int showMenu() {
  print("++++MENU++++");
  print("1 - Para adicionar alimento");
  print("2 - Para ver lista de alimentos cadastrados");
  print("3 - Salvar dados em arquivo");
  print("0 - Finalizar programa");
  int option = int.parse(stdin.readLineSync());
  return option;
}

int showCreateMenu() {
  print("++++MENU DE CRIAÇÃO++++");
  print("1 - Cadastrar alimento industrializado");
  print("2 - Cadastrar alimento natural");
  print("0 - Voltar");
  int option = int.parse(stdin.readLineSync());
  return option;
}

Alimento createAlimento() {
  int option = showCreateMenu();
  print("\n Cadastre os alimentos:");
  print(" Digite o codigo:");
  String codigo = stdin.readLineSync();

  print("Digite o nome:");
  String nome = stdin.readLineSync();

  print("Digite o nome científico:");
  String cientifico = stdin.readLineSync();

  print("Digite o nome em inglês:");
  String ingles = stdin.readLineSync();

  print("Digite o grupo:");
  String grupo = stdin.readLineSync();

  switch (option) {
    case 1:
      print("Digite a marca do fabricante");
      String marca = stdin.readLineSync();

      return Industrializado(
        codigo,
        cientifico,
        nome.split(','),
        ingles.split(','),
        grupo,
        marca,
      );
      break;
    case 2:
      print("Digite a validade no formado yyyy-MM-dd (2021-09-01)");
      String validade = stdin.readLineSync();

      return Natural(
          codigo,
          cientifico,
          nome.split(','),
          ingles.split(','),
          grupo,
          validade );

    default:
      return null;
  }
}

void writeFile(List<Alimento> alimentos) {
  final file = File("arquivo.txt");
  String arquivo = "";
  for (var alimento in alimentos) {
    arquivo += (alimento.toString()) + "\n";
    file.writeAsStringSync(arquivo);
  }
  print("arquivo salvo com sucesso");
}
  void showListAlimentos(List<Alimento> alimentos) {
    for (Alimento alimento in alimentos) {
      print(alimento.toString());
    }
  }

  void main(List<String> args) {
    List<Alimento> alimentos = [];

    int option = -1;

    do {
      option = showMenu();

      switch (option) {
        case 1:
          final alimento = createAlimento();
          alimentos.add(alimento);
          break;

        case 2:
          print("Alimentos");
          showListAlimentos(alimentos);
          break;

        case 3:
          writeFile(alimentos);
          break;

        case 0:
          break;

        default:
          print("Comando invalido");
      }
    } while (option != 0);
  }


