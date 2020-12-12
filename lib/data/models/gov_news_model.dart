import 'package:news/domain/entities/entities.dart';

class GovNewsModel {
  Resultado resultado;

  GovNewsModel({this.resultado});

  GovNewsModel.fromJson(Map<String, dynamic> json) {
    resultado = json['resultado'] != null ? new Resultado.fromJson(json['resultado']) : null;
  }

  List<NewsEntity> toEntityList() => resultado.noticias.noticia.map((noticia) => noticia.toEntity()).toList();
}

class Resultado {
  Noticias noticias;
  int numeroNoticias;

  Resultado({this.noticias, this.numeroNoticias});

  Resultado.fromJson(Map<String, dynamic> json) {
    noticias = json['noticias'] != null ? new Noticias.fromJson(json['noticias']) : null;
    numeroNoticias = json['numeroNoticias'];
  }
}

class Noticias {
  List<Noticia> noticia;

  Noticias({this.noticia});

  Noticias.fromJson(Map<String, dynamic> json) {
    if (json['noticia'] != null) {
      noticia = new List<Noticia>();
      json['noticia'].forEach((v) {
        noticia.add(new Noticia.fromJson(v));
      });
    }
  }
}

class Noticia {
  int id;
  String titulo;
  String fonte;
  String dataDePublicacao;
  String link;
  String resumo;
  int idFonte;
  String descricao;

  Noticia({this.id, this.titulo, this.fonte, this.dataDePublicacao, this.link, this.resumo, this.idFonte, this.descricao});

  Noticia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    fonte = json['fonte'];
    dataDePublicacao = json['dataDePublicacao'];
    link = json['link'];
    resumo = json['resumo'];
    idFonte = json['idFonte'];
    descricao = json['descricao'];
  }

  NewsEntity toEntity() => NewsEntity(this.titulo, this.resumo, this.link);
}
