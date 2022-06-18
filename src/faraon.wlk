import wollok.game.*
import objetos.*
import cuentas.*
import momia.*
import extras.*

object ganar {
	
	method image() = "GANAR.jpg"

	method position() = game.origin()
	
	method ejecutar() {
		game.removeTickEvent("momiaStop")
		game.addVisual(self)
		game.addVisual(mostrarPuntajeFinal)
		game.schedule(8000, { => game.stop()})
	} 
	
}

object perder {
	
	method image() = "PERDER.jpg"

	method position() = game.origin() // game.origin()

	method ejecutar() {
		game.removeTickEvent("momiaStop")
		game.addVisual(self)
		game.addVisual(mostrarPuntajeFinal)
		game.schedule(8000, { => game.stop()})
	} 

	
}



object mostrarPuntajeFinal{
		method position() = game.center() // game.origin()
		
		method text() {
		return 'PUNTAJE TOTAL OBTENIDO:' + puntosDelFaraon.puntosAcumulados() + ''
	}
}

object faraon {

	var property position = game.at(10, 4)
	var property caminaDerecha = 0
	var property caminaIzquierda = 0
	var property seleccionado = null

	method verificarMismaPosicion() {
		if (self.position() == momia.position()) {
			perder.ejecutar()
		}
	}

	method image() {
		if (caminaDerecha > 0) {
			return "faraon_camina_derecha_" + caminaDerecha + ".png"
		} else if (caminaIzquierda > 0) {
			return "faraon_camina_izquierda_" + caminaIzquierda + ".png"
		} else return "faraon_quieto_adelante.png"
	}

	method mover(direccion) {
		self.verificarMismaPosicion()
		self.validarPosicion()
		position = direccion.siguiente(position)
		self.paso(direccion)
	}

	method paso(direccion) {
		if (direccion.esIzquierda()) {
			caminaDerecha = 0
			if (caminaIzquierda < 5) {
				caminaIzquierda++
			} else {
				caminaIzquierda = 1
			}
		} else {
			caminaIzquierda = 0
			if (caminaDerecha < 5) {
				caminaDerecha++
			} else {
				caminaDerecha = 1
			}
		}
	}

	method validarPosicion() {
		if (self.position().x() < 1) {
			caminaIzquierda = 0
			self.error("no puedo moverme mas a la izquierda")
		}
		if ((self.position().x() > 17)) {
			caminaDerecha = 0
			self.error("no puedo moverme mas a la derecha")
		}
	}

//	method moverIzquierda() {
//			self.verificarMismaPosicion()
//		
//		caminaDerecha=0
//		
//		if(self.position().x()<1)  {
//			caminaIzquierda=0
//			//self.error("no puedo moverme más a la izquierda")
//		}
//		else {if(caminaIzquierda==1){
//						caminaIzquierda++
//						position=position.left(1)
//					}
//					
//					else if(caminaIzquierda==2){
//						caminaIzquierda++
//						position=position.left(1)
//					}
//					
//					else if(caminaIzquierda==3){
//						caminaIzquierda++
//						position=position.left(1)
//					}
//					
//					else if(caminaIzquierda==4){
//						caminaIzquierda++
//						position=position.left(1)
//					}
//			
//					else {
//						caminaIzquierda=1
//						position=position.left(1)
//					}}
//	}
//	
//	method moverDerecha() {
//		self.verificarMismaPosicion()
//		caminaIzquierda=0
//		if(self.position().x()>17)  {
//			caminaDerecha=0
//			//self.error("no puedo moverme más a la derecha")
//		}
//		else {
//					if(caminaDerecha==1){
//						caminaDerecha++
//						position=position.right(1)
//					}
//					
//					else if(caminaDerecha==2){
//						caminaDerecha++
//						position=position.right(1)
//					}
//					
//					else if(caminaDerecha==3){
//						caminaDerecha++
//						position=position.right(1)
//					}
//					
//					else if(caminaDerecha==4){
//						caminaDerecha++
//						position=position.right(1)
//					}
//			
//					else {
//						caminaDerecha=1
//						position=position.right(1)
//					}
//		}
//	}
	method moverArriba() {
		self.verificarMismaPosicion()
		caminaDerecha = 0
		caminaIzquierda = 0
		if (game.colliders(self).fold(false, { acum , element => escalera.listaEscalera().contains(element) or acum })) {
			position = position.up(2)
		} else {
//		self.error("para subir necesito una escalera")
		}
	}

	method moverAbajo() {
		self.verificarMismaPosicion()
		caminaDerecha = 0
		caminaIzquierda = 0
		self.image()
		if (game.colliders(self).fold(false, { acum , element => escaleraAbajo.listaEscaleraAbajo().contains(element) or acum })) {
			position = position.down(2)
		} else {
//		self.error("para bajar necesito una escalera")
		}
	}

	// CUENTAS
	method cuentasFaraon() {
			
		if (cuentas.hayEncuadrable(self.position())) {
			const nuevaSeleccion = cuentas.encuadrable(self.position())
			if (seleccionado != null) {
				if (seleccionado.match(nuevaSeleccion)) {
					
					puntosDelFaraon.sumar(seleccionado.total())
					nuevaSeleccion.borrarPantalla(nuevaSeleccion)
					seleccionado.borrarPantalla(seleccionado)
					seleccionado = null
					self.verificaGanar()
				} else {
					seleccionado = nuevaSeleccion
				}
			} else {
				seleccionado = nuevaSeleccion
			}
		}
	}

	method verificaGanar(){
			game.say(self, "se ejecuta verificar!")
		if (cuentas.encuadrables().isEmpty() ){
			game.say(self, "entro en el if!")
			ganar.ejecutar()
		}
	}


}

object puntosDelFaraon {

	var property puntosAcumulados = 0
	var property position = game.at(15, 8)

	method text() {
		return 'PUNTAJE: ' + self.puntosAcumulados()
	}

	method sumar(valor) {
		puntosAcumulados += valor
	}

}

