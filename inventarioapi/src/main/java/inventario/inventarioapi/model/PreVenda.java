package inventario.inventarioapi.model;

import jakarta.persistence.*;


import java.time.LocalDateTime;
import java.time.LocalTime;

@Entity
@Table(name = "NVENDA2")
public class PreVenda {

    @Id
    @Column(name = "CODIGOVENDA")
    private Long codigoVenda;

    @Column(name = "CODLOJA")
    private Long codLoja;

    @ManyToOne
    @JoinColumn(name = "CODVENDEDOR")
    private Funcionario vendedor;

    @Column(name = "SEQUENCIA")
    private Long sequencia;

    @Column(name = "EMISSAO")
    private LocalDateTime emissao = LocalDateTime.now();

    @Column(name = "VALORPROD")
    private Double valorProd;

    @Column(name = "TOTALVENDA")
    private Double totalVenda;

    @Column(name = "NOMECLI")
    private String nomeCli;

    @Column(name = "MAPA")
    private LocalDateTime mapa = LocalDateTime.now();

    @Column(name = "HORA")
    private LocalTime hora = LocalTime.now();

    @Column(name = "NOMEUSUARIO")
    private String nomeUsuario;

    @Column(name = "DAV_NUMERO")
    private Long davNumero;

    @Column(name = "CNPJ_ESTABELECIMENTO")
    private String cpnj;

    public Long getCodLoja() {
        return codLoja;
    }

    public void setCodLoja(Long codLoja) {
        this.codLoja = codLoja;
    }

    public void setSequencia(Long sequencia) {
        this.sequencia = sequencia;
    }

    public void setCodigoVenda(Long codigoVenda) {
        this.codigoVenda = codigoVenda;
    }

    public Long getCodigoVenda() {
        return codigoVenda;
    }

    public LocalDateTime getEmissao() {
        return emissao;
    }

    public void setEmissao(LocalDateTime emissao) {
        this.emissao = emissao;
    }

    public Funcionario getVendedor() {
        return vendedor;
    }

    public void setVendedor(Funcionario vendedor) {
        this.vendedor = vendedor;
    }

    public Double getValorProd() {
        return valorProd;
    }

    public void setValorProd(Double valorProd) {
        this.valorProd = valorProd;
    }

    public Double getTotalVenda() {
        return totalVenda;
    }

    public void setTotalVenda(Double totalVenda) {
        this.totalVenda = totalVenda;
    }

    public String getNomeCli() {
        return nomeCli;
    }

    public void setNomeCli(String nomeCli) {
        this.nomeCli = nomeCli;
    }

    public LocalDateTime getMapa() {
        return mapa;
    }

    public void setMapa(LocalDateTime mapa) {
        this.mapa = mapa;
    }

    public LocalTime getHora() {
        return hora;
    }

    public void setHora(LocalTime hora) {
        this.hora = hora;
    }

    public String getNomeUsuario() {
        return nomeUsuario;
    }

    public void setNomeUsuario(String nomeUsuario) {
        this.nomeUsuario = nomeUsuario;
    }

    public Long getDavNumero() {
        return davNumero;
    }

    public void setDavNumero(Long davNumero) {
        this.davNumero = davNumero;
    }

    public String getCpnj() {
        return cpnj;
    }

    public void setCpnj(String cpnj) {
        this.cpnj = cpnj;
    }

    public void setCodigoVenda(Long sequencia, Long lojaId) {
        var id = String.format("%d%d", lojaId, sequencia);
        this.codigoVenda = Long.parseLong(id);
    }
}