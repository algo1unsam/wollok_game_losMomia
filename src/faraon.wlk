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

object mostrarPuntajeFinal {

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

	method hayEscaleraArriba() {
		return game.colliders(self).fold(false, { acum , element => escalera.listaEscalera().contains(element) or acum })
	}

	method hayEscaleraAbajo() {
		return game.colliders(self).fold(false, { acum , element => escaleraAbajo.listaEscaleraAbajo().contains(element) or acum })
	}

	method validaHayObjeto() {
		if (self.position() == cruz.position()) {
			game.removeVisual(cruz)
			cruz.cambiarPosicion()
			momia.reiniciar()
		}
		if (self.position() == campana.position()) {
			game.removeVisual(campana)
			campana.cambiarPosicion()
			momia.cambiarVelocidad(500)
		}
		if (self.position() == reloj.position()) {
			game.removeVisual(reloj)
			reloj.cambiarPosicion()
			momia.cambiarVelocidad(2000)
		}
	}

	method mover(direccion) {
		direccion.validarMover(self)
		self.validaHayObjeto()
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
		} else if (direccion.esDerecha()) {
			caminaIzquierda = 0
			if (caminaDerecha < 5) {
				caminaDerecha++
			} else {
				caminaDerecha = 1
			}
		} else if (direccion.esArriba()) {
			position = position.up(1)
		} else {
			position = position.down(1)
		}
	}

	// CUENTAS
	method cuentasFaraon() {
		if (cuentas.hayEncuadrable(self.position())) {
			const nuevaSeleccion = cuentas.encuadrable(self.position())
			if (seleccionado != null and seleccionado.position() != nuevaSeleccion.position()) {
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

	method verificaGanar() {
		if (cuentas.encuadrables().isEmpty()) {
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

