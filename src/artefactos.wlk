import castillo.*
import capos.*

object espadaDelDestino {
	
	var primeraVez = true
	
	method poder(personaje) {
		return personaje.poderBase() * self.coeficiente()
	}
	
	method coeficiente(){
		return if (primeraVez) {1} else {0.5}
	}
	
	method usar() {
		primeraVez = false
	}
}

object libroDeHechizos {
	
	var property hechizos = []
	
	method poder(personaje) {
		return if (not hechizos.isEmpty()) { hechizos.first().poder(personaje) } else { 0 }  //.first() elige el primer elemento de la lista
	}
	
	method usar() {
		hechizos.remove(hechizos.first())
		//hechizos = hechizos.drop(1) //piso la lista con un nuevo valor y es aplicando .drop(1) que dandole x parametro el numero del elemento a eliminar(la lista tiene orden) lo descarta en la nueva lista 
	}
}

object collarDivino {
	
	var usos = 0
	
	method poder(personaje) {
		return 3 + self.extra(personaje)
	}
	
	method extra(personaje) {
		return if (personaje.poderBase() > 6) {usos}
			else {0}
	}

	
	method usar() {
		usos += 1
	}	
}


object armaduraDeAceroValyrio{
	
	method poder(personaje) {
		return 6
	}
	
	method usar() {
		
	}
}


//HECHIZOS

object bendicion {
	
	method poder(personaje) {
		return 4
	}
}

object invisibilidad {
	
	method poder(personaje) {
		return personaje.poderBase()
	}
}

object invocacion {
	
	method poder(personaje) {
		return personaje.poderInvocacion()
	}
}
