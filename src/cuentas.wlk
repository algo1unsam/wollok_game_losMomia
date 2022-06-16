import wollok.game.*
import faraon.*

class Cuadro{
	var property position
	
	method image() {
		
		return "cuenta.png"
	}
	
}
 
object cuentas {
	var property listaCuadros=[]	
	var property listaResultado = []
	var property listaCuenta = []
	var cuadroElegido = null
  
	method mostrar() {
		
		const cuadro1 = new Cuadro(position = game.at(2, 0))
		const cuadro2 = new Cuadro(position = game.at(11, 0))
		const cuadro3 = new Cuadro(position = game.at(16, 2))
		const cuadro4 = new Cuadro(position = game.at(11, 2))
		
		listaCuadros = [cuadro1,cuadro2,cuadro3,cuadro4]
		listaCuadros.forEach({ cuadro => game.addVisual(cuadro)})
		
		const cuenta1 = new Cuenta(position = self.elegirCuadro().position() , nro1= (1..100).anyOne() , nro2= (1..100).anyOne())
		
		const resultado1 = new Resultado(position = self.elegirCuadro().position()  , total = cuenta1.total()  )
				
		const cuenta2 = new Cuenta(position = self.elegirCuadro().position()  , nro1= (1..100).anyOne() , nro2= (1..100).anyOne() )
		
		const resultado2 = new Resultado(position = self.elegirCuadro().position() , total = cuenta2.total() )
		
	listaCuenta = [cuenta1, cuenta2]
	listaResultado = [resultado1, resultado2]

	
	//mostrar en pantalla
	
	listaCuenta.forEach({ cuenta => game.addVisual(cuenta)})
	listaResultado.forEach({ resultado => game.addVisual(resultado)})
	
	}

	method elegirCuadro(){
		cuadroElegido = listaCuadros.anyOne()
		listaCuadros.remove(cuadroElegido)
		return cuadroElegido
	}
	

}

//CUENTA
class Cuenta {

	var property nro1
	var property nro2

	var property total = nro1 + nro2

	var property position

	method text(){return ''+nro1+ ' + ' +nro2+''} 
}

class Resultado {


	var property total

	var property position

	method text(){return ''+total+''} 
}