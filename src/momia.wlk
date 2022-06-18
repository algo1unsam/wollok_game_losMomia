import wollok.game.*
import faraon.*
import objetos.*
import extras.*

object momia {

	var property position = game.at(9, 8)
	var property contador = 0

	method image() {
		if (contador==0) {return "momia_tumba_abierta_1.png"}
		if (contador==1) {return "momia_tumba_abierta_2.png"}
		if (contador==2) {return "momia_sale1.png"}
		else return "momia_quieta_adelante.png"
	}

	method start() {
		
		game.schedule(3000, { => game.addVisual(self)})
		game.schedule(4000, { => contador++ })
		game.schedule(5000, { => contador++ })
		game.schedule(6000, { => contador++ })
		game.schedule(7000, { => contador++ })
		game.schedule(8000, { => position=position.left(1) })
		game.schedule(9000, { => position=position.left(1) })
		game.schedule(10000, { => position=position.down(1) })
		game.schedule(11000, { => position=position.down(1) })
		
		game.schedule(12000, { => game.onTick(1000, "momiaStop", { => self.perseguir() })})  //estaba en 1000 //350 es bastante rapido
	
	}
	
	method verificarMismaPosicion() {
		
		if( self.position() == faraon.position() ){
				game.removeTickEvent("momiaStop")
				game.say(self, "te atrape!")			 
				game.schedule(2000, { => game.stop() })
			}
		
	}
	
	method distancia(una){
		return if (self.position().x() > una.position().x()){
			self.position().x() - una.position().x()
		}  else{
			una.position().x()  - self.position().x()
		}
	}
	
	method unaEscaleraAbajoMismoPiso(){
		return escaleraAbajo.listaEscaleraAbajo().filter({ unaEscalera => unaEscalera.position().y() == self.position().y() }).min({una => self.distancia(una)})
	}

	method unaEscaleraArribaMismoPiso(){
		return escalera.listaEscalera().filter({ unaEscalera => unaEscalera.position().y() == self.position().y() }).min({una => self.distancia(una)})
		
	}
	
	method bajarEscalera(){
		if (  game.colliders(self).fold(false, {acum, element => escaleraAbajo.listaEscaleraAbajo().contains(element) or acum })    ){
					
			position=position.down(2)
		}
	}
	
	method perseguir(){
		
		self.verificarMismaPosicion()
		
//		si estoy en el mismo piso, me fijo si esta a mi izquierda o derecha y me muevo
		if(self.position().y() == faraon.position().y()){
				
			if(self.position().x() > faraon.position().x()){
				game.schedule(1000, { => position=position.left(1) })
			}
			else{
				game.schedule(1000, { => position=position.right(1) })
			}
		}
//			si la momia esta encima del faraon
		else if (self.position().y() > faraon.position().y()) {

//BUSCAR ALGUNA ESCALERA CON EL MISMO EJE Y (BUSCAR EN LISTA ESCALERAS ALGUNA)
						
			if ( self.position().x() > self.unaEscaleraAbajoMismoPiso().position().x() ){  
				game.schedule(1000, { => position=position.left(1) })
				self.bajarEscalera()
			}
			else {
			game.schedule(1000, { => position=position.right(1) })
			self.bajarEscalera()
			}
 
// ESTO BAJA CUANDO LA ENCUENTRA

		
		}
		
		else { //faraon arriba de momia
			
			 
			
			if ( self.position().x() > self.unaEscaleraArribaMismoPiso().position().x() ){   
				
				game.schedule(1000, { => position=position.left(1) })
			}
			else {
			
			game.schedule(1000, { => position=position.right(1) })
			}

			if (  game.colliders(self).fold(false, {acum, element => escalera.listaEscalera().contains(element) or acum })    ){
			
			position=position.up(2)
		}
			
		}
		
//		if(self.position().x()==faraon.position().x()){
//			
//			
//			if(self.position().y()!=faraon.position().y()) {
//				
//			 game.removeVisual(self)
//			 if(self.position().y()>faraon.position().y()) {
//			 	
//			 	position=position.down(2)
//			 }
//			 else{
//			 	
//			 	position=position.up(2)
//			 }
//			 
//			 
//			 game.schedule(500, { => game.addVisual(self) })
//			
//			}
//			
//			else {
//				
//				self.verificarMismaPosicion()
//			
//			}
//				
//			}
			
		}
		
		
	}


