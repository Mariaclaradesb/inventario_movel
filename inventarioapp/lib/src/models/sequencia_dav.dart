class Sequencia {
  int? sequencia;
  int? codLoja;

  Sequencia({this.sequencia, this.codLoja});

  factory Sequencia.fromJson(Map<String, dynamic> json) {
    return Sequencia(
      sequencia: json['sequencia'] as int?,
      codLoja: json['codLoja'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sequencia': sequencia,
      'codLoja': codLoja,
    };
  }
}
