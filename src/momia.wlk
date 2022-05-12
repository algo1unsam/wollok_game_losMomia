import wollok.game.*

object momia {

	var property position = game.at(9, 8) // arranca aca

	method image() {
		return "momia_quieta_adelante.png"
	}

	method start() {
		game.schedule(3000, { => game.addVisualCharacter(self)})
		
		game.schedule(5000, { => position=position.left(1) })
		game.schedule(7000, { => position=position.left(1) })
		game.schedule(9000, { => position=position.down(1) })
		game.schedule(10000, { => position=position.down(1) })
		
		self.perseguir()

	}
	
	method perseguir(){
		//game.onTick(3000, "momiaStop", { => position=position.right(1) })
	}

}

