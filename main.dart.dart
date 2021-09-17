
import 'dart:io';

class Alimento {
  String codigo;
  String nome;
  String nomeEmIngles;
  String nomeCientifico;
  String grupo;

  Alimento(this.codigo, this.nome, this.nomeEmIngles, this.nomeCientifico, this.grupo);
}

List<Alimento> alimento1 = [];

cadastro() {
  stdout.write("codigo?");
  var codigop = stdin.readLineSync();
  String codigo = codigop.toString();

  stdout.write("nome?");
  var nomep = stdin.readLineSync();
  String nome = nomep.toString();

  stdout.write("cientifico?");
  var nomeEmInglesp = stdin.readLineSync();
  String nomeEmIngles = nomeEmInglesp.toString();

  stdout.write("ingles?");
  var nomeCientificop = stdin.readLineSync();
  String nomeCientifico = nomeCientificop.toString();

  stdout.write("grupo?");
  var grupop = stdin.readLineSync();
  String grupo = grupop.toString();

  alimento1.add(Alimento(codigo, nome, nomeEmIngles, nomeCientifico, grupo));
}

enquanto() {
  stdout.write("Deseja cadastra um item?  sim ou nao?");
  var reposta1 = stdin.readLineSync();

  while (reposta1 == "sim") {
    cadastro();
    stdout.write("deseja realizar um novo cadastro?");
    reposta1 = stdin.readLineSync();
  }
  verlista();
}

verlista() {
  stdout.write("Deseja ver as lista de Alimentos?  sim ou nao?");
  var reposta2 = stdin.readLineSync();
  if (reposta2 == "sim") {
    for (Alimento p in alimento1) {
      print("Codigo: " +
          p.codigo +
          " , nome: " +
          p.nome +
          " , nome cientifico: " +
          p.nomeEmIngles +
          " , nome em ingles: " +
          p.nomeCientifico +
          " , grupo: " +
          p.grupo);
    }
    print('');
    stdout.write("deseja realizar um novo cadastro?");
    var reposta3 = stdin.readLineSync();
    if (reposta3 == "sim") {
      enquanto();
    } else {
      print("ok");
    }
  }
}

void main() {
  enquanto();
}
