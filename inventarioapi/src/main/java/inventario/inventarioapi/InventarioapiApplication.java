package inventario.inventarioapi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = "inventario.inventarioapi")
public class InventarioapiApplication {

	public static void main(String[] args) {
		SpringApplication.run(InventarioapiApplication.class, args);
	}

}
