import wollok.game.*
import faraon.*
import momia.*
import objetos.*
import cuentas.*
import extras.*

object menu {

	method image() = "INTRO.png"

	method position() = game.origin()

	method ejecutar() = game.addVisual(self)

	method ocultar() = game.removeVisual(self)

}

object instrucciones{
	var property position = game.origin()
	
	method image() = "instrucciones.png"

	method ejecutar() = game.addVisual(self)

	method ocultar() {position = game.at(20, 20)}
		
}

object juego {

	method empezar() {
		menu.ocultar()
		
		instrucciones.ocultar()
		
			// ventanas
		ventana.mostrar()
			// escaleras
		escalera.mostrar()
			// escalera abajo
		escaleraAbajo.mostrar()
			// CUENTAS
		cuentas.mostrar()
			// FARAON
		momia.start()
			// mostrar puntaje
		game.addVisual(puntosDelFaraon)
		
			// objetos
//			objetos.mostrar()
		game.schedule(15000, { objetos.mostrar()} )
			
			// personaje principal 
		game.addVisual(faraon) // img en 250px
		keyboard.left().onPressDo({ faraon.mover(izquierda)})
		keyboard.right().onPressDo({ faraon.mover(derecha)})
		keyboard.up().onPressDo({ faraon.mover(arriba)})
		keyboard.down().onPressDo({ faraon.mover(abajo)})
		keyboard.space().onPressDo({ faraon.cuentasFaraon()})

	 
		
	}

}

