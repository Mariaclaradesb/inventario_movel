package inventario.inventarioapi.model;

import jakarta.persistence.*;

import java.time.LocalDateTime;

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
    private LocalDateTime data;

    @Column(name = "HORA")
    private String hora;

    @Column(name = "NOME")
    private String nome;

    @Column(name= "DISPONIVEL_EFD")
    private int disponivelEfd;

    public InventarioData() {
    }

    public InventarioData(Long codigo, LojaFisica loja, LocalDateTime data, String hora, String nome, int disponivelEfd) {
        this.codigo = codigo;
        this.loja = loja;
        this.data = data;
        this.hora = hora;
        this.nome = nome;
        this.disponivelEfd = disponivelEfd;
    }

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

    public LocalDateTime getData() {
        return data;
    }

    public void setData(LocalDateTime data) {
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

    public int getDisponivelEfd() {
        return disponivelEfd;
    }

    public void setDisponivelEfd(int disponivelEfd) {
        this.disponivelEfd = disponivelEfd;
    }

}
