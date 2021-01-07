import 'package:news/domain/entities/news_entity.dart';

class GovNewsModel {
  Resultado resultado;

  GovNewsModel({this.resultado});

  GovNewsModel.fromJson(Map<String, dynamic> json) {
    resultado = json['resultado'] != null
        ? new Resultado.fromJson(json['resultado'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.resultado != null) {
      data['resultado'] = this.resultado.toJson();
    }
    return data;
  }

  List<NewsEntity> toEntityList() =>
      resultado.noticias.noticia.map((news) => news.toEntity()).toList();
}

class Resultado {
  Noticias noticias;
  int numeroNoticias;

  Resultado({this.noticias, this.numeroNoticias});

  Resultado.fromJson(Map<String, dynamic> json) {
    noticias = json['noticias'] != null
        ? new Noticias.fromJson(json['noticias'])
        : null;
    numeroNoticias = json['numeroNoticias'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.noticias != null) {
      data['noticias'] = this.noticias.toJson();
    }
    data['numeroNoticias'] = this.numeroNoticias;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.noticia != null) {
      data['noticia'] = this.noticia.map((v) => v.toJson()).toList();
    }
    return data;
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

  Noticia(
      {this.id,
      this.titulo,
      this.fonte,
      this.dataDePublicacao,
      this.link,
      this.resumo,
      this.idFonte,
      this.descricao});

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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['fonte'] = this.fonte;
    data['dataDePublicacao'] = this.dataDePublicacao;
    data['link'] = this.link;
    data['resumo'] = this.resumo;
    data['idFonte'] = this.idFonte;
    data['descricao'] = this.descricao;
    return data;
  }

  NewsEntity toEntity() => NewsEntity(titulo, resumo, link);
}
