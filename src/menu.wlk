import wollok.game.*
import faraon.*
import momia.*
import objetos.*
import cuentas.*
import extras.*

object menu {

	var property position = game.origin()
	var property imagen = 0

	method image(){return "imagen_"+imagen+".png"}

	method ejecutar() {
	game.addVisual(self)
	}

	method cambiarAInstrucciones(){
		imagen = 1
	}

	method ocultar() = game.removeVisual(self)

}

object juego {

	method empezar() {
		
		menu.ocultar()
		
		ventana.mostrar() // ventanas
		escalera.mostrar() // escaleras
		escaleraAbajo.mostrar() // escalera abajo
		cuentas.mostrar() // cuentas
		momia.start() // momia
		game.addVisual(puntosDelFaraon) // mostrar puntaje
		game.schedule(5000, { => game.onTick(10000, "fin", { => objetos.mostrar()})}) // objetos
		game.addVisual(faraon) // faraon
		keyboard.left().onPressDo({ faraon.mover(izquierda)})
		keyboard.right().onPressDo({ faraon.mover(derecha)})
		keyboard.up().onPressDo({ faraon.mover(arriba)})
		keyboard.down().onPressDo({ faraon.mover(abajo)})
		keyboard.space().onPressDo({ faraon.cuentasFaraon()})
	}

}

