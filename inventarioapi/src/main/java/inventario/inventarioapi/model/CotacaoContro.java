package inventario.inventarioapi.model;

import java.time.LocalDateTime;

import jakarta.persistence.*;

@Entity
@Table(name = "COTACAOCONTRO")
public class CotacaoContro {

    @Id
    @Column(name = "CODIGO")
    private Long codigo;

    @ManyToOne
    @JoinColumn(name= "CODLOJA")
    private Empresa loja;

    @Column(name = "NOME")
    private String nome;

    @Column(name = "DATA")
    private LocalDateTime data;

    @Column(name = "SEQUENCIA")
    private Double sequencia;

    @Column(name = "DATA_VALIDADE")
    private LocalDateTime dataValidade;

    @Column(name = "DATA_FECHAMENTO")
    private LocalDateTime dataFechamento;
    
    @Column(name = "DATA_ENVIO")
    private LocalDateTime dataEnvio;

    @Column(name = "DATA_ESPERADA")
    private LocalDateTime dataEsperada;

    @Column(name = "ID_COTACAO")
    private String idCotacao;

    @Column(name = "URL_COTACAO")
    private String urlCotacao;

    @Column(name = "STATUS")
    private int status;

    public CotacaoContro() {
        this.codigo = 1L;
    }

    public Long getCodigo() {
        return codigo;
    }

    public void setCodigo(Long codigo) {
        this.codigo = codigo;
    }

    public Empresa getLoja() {
        return loja;
    }

    public void setLoja(Empresa loja) {
        this.loja = loja;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public LocalDateTime getData() {
        return data;
    }

    public void setData(LocalDateTime data) {
        this.data = data;
    }

    public Double getSequencia() {
        return sequencia;
    }

    public void setSequencia(Double sequencia) {
        this.sequencia = sequencia;
    }

    public LocalDateTime getDataValidade() {
        return dataValidade;
    }

    public void setDataValidade(LocalDateTime dataValidade) {
        this.dataValidade = dataValidade;
    }

    public LocalDateTime getDataFechamento() {
        return dataFechamento;
    }

    public void setDataFechamento(LocalDateTime dataFechamento) {
        this.dataFechamento = dataFechamento;
    }

    public LocalDateTime getDataEnvio() {
        return dataEnvio;
    }

    public void setDataEnvio(LocalDateTime dataEnvio) {
        this.dataEnvio = dataEnvio;
    }

    public LocalDateTime getDataEsperada() {
        return dataEsperada;
    }

    public void setDataEsperada(LocalDateTime dataEsperada) {
        this.dataEsperada = dataEsperada;
    }

    public String getIdCotacao() {
        return idCotacao;
    }

    public void setIdCotacao(String idCotacao) {
        this.idCotacao = idCotacao;
    }

    public String getUrlCotacao() {
        return urlCotacao;
    }

    public void setUrlCotacao(String urlCotacao) {
        this.urlCotacao = urlCotacao;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
}
