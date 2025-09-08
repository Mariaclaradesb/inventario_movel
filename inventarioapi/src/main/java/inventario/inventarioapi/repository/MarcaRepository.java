package inventario.inventarioapi.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import inventario.inventarioapi.model.Marca;

public interface MarcaRepository extends JpaRepository<Marca, Long> {
    
}
