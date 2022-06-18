import wollok.game.*
import objetos.*
import cuentas.*
import momia.*
import extras.*

object faraon {

	var property position=game.at(10, 4)
	var property caminaDerecha = 0
	var property caminaIzquierda = 0
	
	var property seleccionado = null	


	method verificarMismaPosicion() {
		
		if(self.position() == momia.position()){
				
				game.say(self, "me mato la momia!")			 
				game.schedule(2000, { => game.stop() })
			}
	}
	

	method image() {
	
	if(caminaDerecha>0){return "faraon_camina_derecha_"+caminaDerecha+".png"}
	else if(caminaIzquierda>0){return "faraon_camina_izquierda_"+caminaIzquierda+".png"}
	else return "faraon_quieto_adelante.png"
	
	}
	
	method mover(direccion) {
		
		position=direccion.siguiente(position)
		self.paso(direccion)
		
	}
	
	method paso(direccion){
		
		if(direccion.esIzquierda()){
			caminaDerecha=0
			if(caminaIzquierda<5){caminaIzquierda++}
			else {caminaIzquierda=1}
			
		}
		else{
			caminaIzquierda=0
			if(caminaDerecha<5){caminaDerecha++}
			else {caminaDerecha=1}
		
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
 		caminaDerecha=0
		caminaIzquierda=0

		if (  game.colliders(self).fold(false, {acum, element => escalera.listaEscalera().contains(element) or acum })    ){
			position=position.up(2)
		}
		else{		

//		self.error("para subir necesito una escalera")
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


//		self.error("para bajar necesito una escalera")
		}

	}
	
	//CUENTAS
	
	method cuentasFaraon(){
		
		
		if (  cuentas.hayEncuadrable(self.position())) {
			const nuevaSeleccion = cuentas.encuadrable(self.position())
			if( seleccionado != null) {
				if(seleccionado.match(nuevaSeleccion)) {
					puntosDelFaraon.sumar(seleccionado.total())
					nuevaSeleccion.borrarPantalla(nuevaSeleccion)
					seleccionado.borrarPantalla(seleccionado)
					seleccionado = null
				}
				else {
					seleccionado = nuevaSeleccion
				}
			}
			else {
				seleccionado = nuevaSeleccion
			}
		}

	}
	
	
}

object puntosDelFaraon{
	var property puntosAcumulados = 0

	var property position=game.at(15, 8)

	method text(){return 'PUNTAJE: '+ self.puntosAcumulados()}
	
	method sumar(valor){
		puntosAcumulados += valor
	}
	
}
	
