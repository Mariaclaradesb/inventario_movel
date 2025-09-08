package inventario.inventarioapi.repository;

import inventario.inventarioapi.model.Produto;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProdutosRepository extends JpaRepository<Produto, Long> {
}
