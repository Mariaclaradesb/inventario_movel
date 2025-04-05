package inventario.inventarioapi.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import inventario.inventarioapi.model.Marcas;

public interface MarcaRepository extends JpaRepository<Marcas, Long> {
    
}
