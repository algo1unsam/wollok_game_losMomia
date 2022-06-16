import wollok.game.*
import objetos.*
import cuentas.*
import momia.*

object faraon {

	var property position=game.at(10, 4)
	var property caminaDerecha
	var property caminaIzquierda
	
	var property almacenar1 = 9999
	var property almacenar2 = -9999
	var property almacenoCuenta1
	var property almacenoCuenta2
	var property almacenoCuadro1 
	var property almacenoCuadro2 

//		var property almaceno = []

method verificarMismaPosicion() {
		
		if(self.position().x()==momia.position().x() and self.position().y()==momia.position().y()){
				game.removeVisual(self)
				game.say(self, "me mato la momia!")			 
				game.schedule(2000, { => game.stop() })
			}
	}
	
	
	method image() {
		if(caminaDerecha==1){return "faraon_camina_derecha_1.png"}
		if(caminaDerecha==2){return "faraon_camina_derecha_2.png"}
		if(caminaDerecha==3){return "faraon_camina_derecha_3.png"}
		if(caminaDerecha==4){return "faraon_camina_derecha_4.png"}
		if(caminaDerecha==5){return "faraon_camina_derecha_5.png"}
		if(caminaIzquierda==1){return "faraon_camina_izquierda_1.png"}
		if(caminaIzquierda==2){return "faraon_camina_izquierda_2.png"}
		if(caminaIzquierda==3){return "faraon_camina_izquierda_3.png"}
		if(caminaIzquierda==4){return "faraon_camina_izquierda_4.png"}
		if(caminaIzquierda==5){return "faraon_camina_izquierda_5.png"}
		else return "faraon_quieto_adelante.png"
	}
	
	method moverIzquierda() {
			self.verificarMismaPosicion()
		
		caminaDerecha=0
		
		if(self.position().x()<1)  {
			caminaIzquierda=0
			self.error("no puedo moverme más a la izquierda")
		}
		else {if(caminaIzquierda==1){
						caminaIzquierda++
						position=position.left(1)
					}
					
					else if(caminaIzquierda==2){
						caminaIzquierda++
						position=position.left(1)
					}
					
					else if(caminaIzquierda==3){
						caminaIzquierda++
						position=position.left(1)
					}
					
					else if(caminaIzquierda==4){
						caminaIzquierda++
						position=position.left(1)
					}
			
					else {
						caminaIzquierda=1
						position=position.left(1)
					}}
	}
	
	method moverDerecha() {
		self.verificarMismaPosicion()
		caminaIzquierda=0
		if(self.position().x()>17)  {
			caminaDerecha=0
			self.error("no puedo moverme más a la derecha")
		}
		else {
					if(caminaDerecha==1){
						caminaDerecha++
						position=position.right(1)
					}
					
					else if(caminaDerecha==2){
						caminaDerecha++
						position=position.right(1)
					}
					
					else if(caminaDerecha==3){
						caminaDerecha++
						position=position.right(1)
					}
					
					else if(caminaDerecha==4){
						caminaDerecha++
						position=position.right(1)
					}
			
					else {
						caminaDerecha=1
						position=position.right(1)
					}
		}
	}
	
	
	method moverArriba() {
 		self.verificarMismaPosicion()
 		caminaDerecha=0
		caminaIzquierda=0
// otra forma para que suba en todas las escaleras(supongo que colisiona solo con una escalera)		
//		if (escalera.listaEscalera().contains(game.colliders(self).get(0))){
//			position=position.up(2)
//		}

		if (  game.colliders(self).fold(false, {acum, element => escalera.listaEscalera().contains(element) or acum })    ){
			position=position.up(2)
		}
		else{		
//		caminaDerecha=0
//		caminaIzquierda=0
		self.error("para subir necesito una escalera")
		}	
	}
	
	method moverAbajo() {
		self.verificarMismaPosicion()
		caminaDerecha=0
		caminaIzquierda=0
		self.image()
		if (  game.colliders(self).fold(false, {acum, element => escaleraAbajo.listaEscaleraAbajo().contains(element) or acum })    ){
			position=position.down(2)
		}
		else{			
//		caminaDerecha=0
//		caminaIzquierda=0
		self.error("para bajar necesito una escalera")
		}

	}
	
	//CUENTAS
	
	method cuentasFaraon(){
		if (  game.colliders(self).fold(false, {acum, element => cuentas.listaCuenta().contains(element) or acum })    ){
			
			self.almacenar1 ( game.colliders(self).last().total() )
//			game.say(self, "nro1: almacenado:" + self.almacenar1() )   
			almacenoCuenta1 = game.colliders(self).last()
			almacenoCuadro1 = game.colliders(self).first()
			
//			almaceno.add(game.colliders(self).last())
//			almaceno.add(game.colliders(self).first())
			
		}


		if (  game.colliders(self).fold(false, {acum, element => cuentas.listaResultado().contains(element) or acum })    ){
				self.almacenar2 ( game.colliders(self).last().total() )
//				game.say(self, "nro2 almacenado:" + self.almacenar2()   )
				almacenoCuenta2 = game.colliders(self).last()
				almacenoCuadro2 = game.colliders(self).first()
				
//				almaceno.add(game.colliders(self).last())
//				almaceno.add(game.colliders(self).first())
				
			}
			

		if ( self.almacenar1() == self.almacenar2() ){
			game.removeVisual(almacenoCuenta1)
			game.removeVisual(almacenoCuenta2)
			game.removeVisual(almacenoCuadro1)
			game.removeVisual(almacenoCuadro2)
			
//			almaceno.forEach({ cosas => game.removeVisual(cosas) })
//			almaceno.clear()
			
//			game.say(self, "la cuenta es correcta!")
		}

	}
	
	
}
	
