// @dart=2.9

import 'dart:io';

class Alimento {
  String codigo;
  List<String> nome;
  List<String> cientifico;
  String ingles;
  String grupo;
  Alimento(this.codigo, this.nome, this.cientifico, this.ingles, this.grupo);

}

class Industrializado extends Alimento {
  String marca;

  Industrializado(this.marca, String codigo, List<String> nome,
      List<String> cientifico, String ingles, String grupo)
      : super(codigo, nome, cientifico, ingles, grupo);
}

class Natural extends Alimento {
  String validade;

  Natural(this.validade, String codigo, List<String> nome,
      List<String> cientifico, String ingles, String grupo)
      : super(codigo, nome, cientifico, ingles, grupo);

  String toString(){
    return"Nome l: $validade";
  }
}

void arquivotxt(
    List<Industrializado> industrializados, List<Natural> naturais) {
  final file = File("listaAlimentosIsac.txt");
  String arquivo = "Alimentos Industrializados\n";
  for (Industrializado industrializado in industrializados) {
    arquivo +=
        "Codigo: ${industrializado.codigo} | Nome: ${industrializado.nome} | Nome Cientifico: ${industrializado.cientifico} | Inglês: ${industrializado.ingles} | Grupo:${industrializado.grupo} | Marca:${industrializado.marca} " +
            "\n";
  }
  arquivo += "Alimentos Naturais\n";
  for (Natural natural in naturais) {
    arquivo +=
        "Codigo: ${natural.codigo} | Nome: ${natural.nome} | Nome Cientifico: ${natural.cientifico} | Inglês: ${natural.ingles} | Grupo:${natural.grupo} | Validade:${natural.validade}" +
            "\n";
  }
  print("arquivo salvo com sucesso");

  file.writeAsStringSync(arquivo);
}

void main(List<String> args) {
  List<Alimento> alimentos = [];
  List<Industrializado> industrializados = [];
  List<Natural> naturais = [];

  int option = -1;

  do {
    option = showMenu();

    switch (option) {
      case 1:
        final alimento = createAlimento();
        alimentos.add(alimento);
        break;

      case 2:
        final industrializado = createIndustrializado();
        industrializados.add(industrializado);
        break;

      case 3:
        final natural = createNatural();
        naturais.add(natural);
        break;

      case 4:
        print("Alimentos");
        showListAlimentos(alimentos);
        print("Alimentos Industrializados");
        showListIndustrializados(industrializados);
        print("Alimentos Naturais");
        showListNaturais(naturais);
        break;

      case 5:
        arquivotxt(industrializados, naturais);
        break;

      case 0:
        break;

      default:
        print("Comando invalido");
    }
  } while (option != 0);
}

int showMenu() {
  print("++++MENU++++");
  print("1 - Para cadastrar alimento");
  print("2 - Para adicionar alimento Industrializados");
  print("3 - Para adicionar alimento naturais");
  print("4 - Para ver lista de alimentos cadastrados");
  print("5 - Para salvar em um documento de texto");
  print("0 - Finalizar Proframa");
  int option = int.parse(stdin.readLineSync());
  return option;
}

Alimento createAlimento() {
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

  return Alimento(
    codigo,
    nome.split(','),
    cientifico.split(','),
    ingles,
    grupo,
  );
}

void showListAlimentos(List<Alimento> alimentos) {
  for (Alimento alimento in alimentos) {
    print(
        "Codigo: ${alimento.codigo} | Nome: ${alimento.nome} | Nome Cientifico: ${alimento.cientifico} | Inglês: ${alimento.ingles} | Grupo:${alimento.grupo}");
  }
}

Industrializado createIndustrializado() {
  print("\n Alimento Industrializados:");

  print("Digite o codigo do alimento:");
  String codigo = stdin.readLineSync();

  print("Digite o nome:");
  String nome = stdin.readLineSync();

  print("Digite o nome científico:");
  String cientifico = stdin.readLineSync();

  print("Digite o nome em inglês:");
  String ingles = stdin.readLineSync();

  print("Digite o grupo:");
  String grupo = stdin.readLineSync();
  print("Digite a marca do Fabricante:");
  String marca = stdin.readLineSync();

  return Industrializado(
    marca,
    codigo,
    nome.split(','),
    cientifico.split(','),
    ingles,
    grupo,
  );
}

void showListIndustrializados(List<Industrializado> industrializados) {
  for (Industrializado industrializado in industrializados) {
    print(
        "Codigo: ${industrializado.codigo} | Nome: ${industrializado.nome} | Nome Cientifico: ${industrializado.cientifico} | Inglês: ${industrializado.ingles} | Grupo:${industrializado.grupo} | Marca:${industrializado.marca}");
  }
}

createNatural() {
  print("\n Alimento Naturais:");
  print("Digite o codigo:");
  String codigo = stdin.readLineSync();

  print("Digite o nome:");
  String nome = stdin.readLineSync();

  print("Digite o nome cientifico:");
  String cientifico = stdin.readLineSync();

  print("Digite o nome em ingles:");
  String ingles = stdin.readLineSync();

  print("Digite o grupo:");
  String grupo = stdin.readLineSync();

  print("Digite a validade:");
  String validade = stdin.readLineSync();
  return Natural(
    validade,
    codigo,
    nome.split(','),
    cientifico.split(','),
    ingles,
    grupo,
  );
}

void showListNaturais(List<Natural> naturais) {
  for (Natural natural in naturais) {
    print(
        "Codigo: ${natural.codigo} | Nome: ${natural.nome} | Nome Cientifico: ${natural.cientifico} | Inglês: ${natural.ingles} | Grupo:${natural.grupo} | Validade:${natural.validade}");
  }
}

