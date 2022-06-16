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
		const cuadro5 = new Cuadro(position = game.at(5, 4))
		const cuadro6 = new Cuadro(position = game.at(16, 6))
		const cuadro7 = new Cuadro(position = game.at(5, 0))
		const cuadro8 = new Cuadro(position = game.at(16, 0))
		const cuadro9 = new Cuadro(position = game.at(1, 2))
		const cuadro10 = new Cuadro(position = game.at(13, 4))
		const cuadro11 = new Cuadro(position = game.at(1, 6))
		const cuadro12 = new Cuadro(position = game.at(8, 6))
		
//		listaCuadros = [cuadro1,cuadro2,cuadro3,cuadro4,cuadro5,cuadro6,cuadro7,cuadro8,cuadro9,cuadro10,cuadro11,cuadro12]
		listaCuadros.addAll(#{cuadro1,cuadro2,cuadro3,cuadro4,cuadro5,cuadro6,cuadro7,cuadro8,cuadro9,cuadro10,cuadro11,cuadro12})
		listaCuadros.forEach({ cuadro => game.addVisual(cuadro)})
		
		const cuenta1 = new Cuenta(position = self.elegirCuadro().position() , nro1= (1..100).anyOne() , nro2= (1..100).anyOne())
		const resultado1 = new Resultado(position = self.elegirCuadro().position()  , total = cuenta1.total()  )
		const cuenta2 = new Cuenta(position = self.elegirCuadro().position()  , nro1= (1..100).anyOne() , nro2= (1..100).anyOne() )
		const resultado2 = new Resultado(position = self.elegirCuadro().position() , total = cuenta2.total() )
		const cuenta3 = new Cuenta(position = self.elegirCuadro().position()  , nro1= (1..100).anyOne() , nro2= (1..100).anyOne() )
		const resultado3 = new Resultado(position = self.elegirCuadro().position() , total = cuenta3.total() )
		const cuenta4 = new Cuenta(position = self.elegirCuadro().position()  , nro1= (1..100).anyOne() , nro2= (1..100).anyOne() )
		const resultado4 = new Resultado(position = self.elegirCuadro().position() , total = cuenta4.total() )
		const cuenta5 = new Cuenta(position = self.elegirCuadro().position()  , nro1= (1..100).anyOne() , nro2= (1..100).anyOne() )
		const resultado5 = new Resultado(position = self.elegirCuadro().position() , total = cuenta5.total() )
		const cuenta6 = new Cuenta(position = self.elegirCuadro().position()  , nro1= (1..100).anyOne() , nro2= (1..100).anyOne() )
		const resultado6 = new Resultado(position = self.elegirCuadro().position() , total = cuenta6.total() )
		
//	listaCuenta = [cuenta1,cuenta2,cuenta3,cuenta4,cuenta5,cuenta6]
//	listaResultado = [resultado1,resultado2,resultado3,resultado4,resultado5,resultado6]

	listaCuenta.addAll(#{cuenta1,cuenta2,cuenta3,cuenta4,cuenta5,cuenta6})
	listaResultado.addAll(#{resultado1,resultado2,resultado3,resultado4,resultado5,resultado6})
		
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