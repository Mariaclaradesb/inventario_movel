package inventario.inventarioapi.repository;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import inventario.inventarioapi.model.VProduto;

@Repository
public interface VprodutosRepository extends JpaRepository<VProduto, Long> {
}
