import wollok.game.*
import objetos.*
import cuentas.*

object faraon {

	var property position=game.at(10, 4)
	var property caminaDerecha
	var property caminaIzquierda
	
	var property almacenar1 = 9999
	var property almacenar2 = -9999
	var property almacenoTemp1
	var property almacenoTemp2 
	

	
	
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
		
		caminaDerecha=0
	 	self.image()
		
		if(self.position().x()<1)  {
			caminaIzquierda=0
			self.image()
			self.error("no puedo moverme más a la izquierda")
		}
		else {if(caminaIzquierda==1){
						caminaIzquierda++
						self.image()
						position=position.left(1)
					}
					
					else if(caminaIzquierda==2){
						caminaIzquierda++
						self.image()
						position=position.left(1)
					}
					
					else if(caminaIzquierda==3){
						caminaIzquierda++
						self.image()
						position=position.left(1)
					}
					
					else if(caminaIzquierda==4){
						caminaIzquierda++
						self.image()
						position=position.left(1)
					}
			
					else {
						caminaIzquierda=1
						self.image()
						position=position.left(1)
			
					}}
	}
	
	method moverDerecha() {
		
		caminaIzquierda=0
		self.image()
		
		if(self.position().x()>17)  {
			caminaDerecha=0
			self.image()
			self.error("no puedo moverme más a la derecha")
		}
		else {
					
					
					if(caminaDerecha==1){
						caminaDerecha++
						self.image()
						position=position.right(1)
					}
					
					else if(caminaDerecha==2){
						caminaDerecha++
						self.image()
						position=position.right(1)
					}
					
					else if(caminaDerecha==3){
						caminaDerecha++
						self.image()
						position=position.right(1)
					}
					
					else if(caminaDerecha==4){
						caminaDerecha++
						self.image()
						position=position.right(1)
					}
			
					else {
						caminaDerecha=1
						self.image()
						position=position.right(1)
			
					}
		
		}
	}
	
	
	method moverArriba() {
 
 		caminaDerecha=0
		caminaIzquierda=0
		self.image()
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
//		self.image()
		self.error("para subir necesito una escalera")
		}
		
	}
	

	
	method moverAbajo() {
		
		caminaDerecha=0
		caminaIzquierda=0
		self.image()
		if (  game.colliders(self).fold(false, {acum, element => escaleraAbajo.listaEscaleraAbajo().contains(element) or acum })    ){
			position=position.down(2)
		}
		else{			
//		caminaDerecha=0
//		caminaIzquierda=0
//		self.image()
		self.error("para bajar necesito una escalera")
		}

	}
	
	
	
	
	//CUENTAS
 
	 
	
	method cuentas(){
		if (  game.colliders(self).fold(false, {acum, element => cuenta.listaCuenta().contains(element) or acum })    ){
			
			self.almacenar1 ( game.colliders(self).first().total() )
			game.say(self, "nro1: " + self.almacenar1() )
			almacenoTemp1 = game.colliders(self).first()
		}


		if (  game.colliders(self).fold(false, {acum, element => resultado.listaResultado().contains(element) or acum })    ){
				self.almacenar2 ( game.colliders(self).first().total() )
				game.say(self, "nro2: " + self.almacenar2() )
				almacenoTemp2 = game.colliders(self).first()
			}
			

				if ( self.almacenar1() == self.almacenar2() ){
			game.removeVisual( almacenoTemp1 )
			game.removeVisual( almacenoTemp2 )
			game.say(self, "la cuenta es correcta!")
			resultado.contador(1)
			cuenta.listaCuenta().drop(1)
		}

 

		

	}
	
//			self.almacenar1(      cuenta.listaCuenta().colliders(self).total()    )	
	
//			self.almacenar1(     cuenta.listaCuenta().find({ cuentaa => cuentaa.total() })   ) dice algo coherente
	
//self.almacenar1(      cuenta.listaCuenta().first().total()    )   coherente 2 	
	
	
	

	
}
	
