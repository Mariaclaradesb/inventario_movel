package inventario.inventarioapi.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "INVENTARIO_DATA")
public class InventarioData {
    @Id
    @Column(name = "CODIGO")
    private Long codigo;

    @ManyToOne
    @JoinColumn(name= "CODLOJA")
    private LojaFisica loja;

    @Column(name = "DATA")
    private String data;

    @Column(name = "HORA")
    private String hora;

    @Column(name = "NOME")
    private String nome;

    @Column(name= "DISPONIVEL_EFD")
    private String disponivelEfd;

    public Long getCodigo() {
        return codigo;
    }

    public void setCodigo(Long codigo) {
        this.codigo = codigo;
    }

    public LojaFisica getLoja() {
        return loja;
    }

    public void setLoja(LojaFisica loja) {
        this.loja = loja;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDisponivelEfd() {
        return disponivelEfd;
    }

    public void setDisponivelEfd(String disponivelEfd) {
        this.disponivelEfd = disponivelEfd;
    }

}
