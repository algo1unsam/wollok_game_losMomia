import faraon.*
import momia.*

object izquierda {

	method siguiente(position) {
		return position.left(1)
	}

	method esIzquierda() = true
	
	method validarMover(personaje){
		
		if (personaje.position().x() < 1) {
			personaje.caminaIzquierda(0)
			personaje.error("no puedo moverme mas a la izquierda")
		}
		
	}

}

object derecha {

	method siguiente(position) {
		return position.right(1)
	}

	method esIzquierda() = false
	
	method validarMover(personaje){
		
		if (personaje.position().x() > 17) {
			personaje.caminaDerecha(0)
			personaje.error("no puedo moverme mas a la derecha")
		}
		
	}

}

object arriba {

	method siguiente(position) {
		return position.up(1)
	}

}

object abajo {

	method siguiente(position) {
		return position.down(1)
	}

}

