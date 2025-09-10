package inventario.inventarioapi.model;

import jakarta.persistence.*;

import java.time.Instant;
import java.time.LocalTime;

@Entity
@Table(name = "NVENDA2")
public class PreVenda {
    @Id
    @Column(name = "CODIGOVENDA")
    private Long codigoVenda;

    @ManyToOne
    @JoinColumn(name = "CODLOJA", referencedColumnName = "CODIGO", insertable = false, updatable = false)
    private Empresa loja;

    @Column(name = "EMISSAO")
    private Instant emissao = Instant.now();

    @ManyToOne
    @JoinColumn(name = "CODVENDEDOR")
    private Funcionario vendedor;

    @Column(name = "VALORPROD")
    private Double valorProd;

    @Column(name = "TOTALVENDA")
    private Double totalVenda;

    @Column(name = "NOMECLI")
    private String nomeCli;

    @Column(name = "MAPA")
    private Instant mapa = Instant.now();

    @Column(name = "HORA")
    private LocalTime hora = LocalTime.now();

    @Column(name = "NOMEUSUARIO")
    private String nomeUsuario;

    @OneToOne
    @JoinColumns({
        @JoinColumn(name = "SEQUENCIA", referencedColumnName = "SEQUENCIA"),
        @JoinColumn(name = "CODLOJA", referencedColumnName = "CODLOJA")
    })

    private Sequencia sequencia;

    @Column(name = "DAV_NUMERO")
    private Long davNumero;

    @Column(name = "CNPJ_ESTABELECIMENTO")
    private String cpnj;

    public Long getCodigoVenda() {
        return codigoVenda;
    }

    public void setCodigoVenda(Long sequencia, Long lojaId) {
        var id = String.format("%d%d", lojaId, sequencia);
        this.codigoVenda = Long.parseLong(id);
    }

    public Empresa getLoja() {
        return loja;
    }

    public void setLoja(Empresa loja) {
        this.loja = loja;
    }

    public Instant getEmissao() {
        return emissao;
    }

    public void setEmissao(Instant emissao) {
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

    public Instant getMapa() {
        return mapa;
    }

    public void setMapa(Instant mapa) {
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

    public Sequencia getSequencia() {
        return sequencia;
    }

    public void setSequencia(Sequencia sequencia) {
        this.sequencia = sequencia;
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
}
