package inventario.inventarioapi.model.dto;

public class EmpresaDTO {
    private Long codigo;
    private String nome;

    public EmpresaDTO(Long codigo, String nome) {
        this.codigo = codigo;
        this.nome = nome;
    }

    public Long getCodigo() {
        return codigo;
    }

    public String getNome() {
        return nome;
    }
    
}
