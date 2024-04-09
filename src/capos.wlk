import artefactos.*
import castillo.*

object rolando {
	
	var property poderBase = 5
	var property capacidad = 2
	const property artefactos = #{}
	var property hogar = castilloDePiedra
	const property historialDeArtefactos = []
	
	method agarrar(artefacto){
		if (self.puedeAgragar()) {artefactos.add(artefacto)}
		historialDeArtefactos.add(artefacto)
	}
	
	method puedeAgragar() {
		return artefactos.size() < capacidad // .size() es el tamaño
	}
	
	method irAlHogar() {
		self.guardarArtefactosEnHogar(artefactos)
		self.liberarEspacio()
	}
	
	method guardarArtefactosEnHogar(_artefactos) { //guarda todo en el castillo
		hogar.guardarArtefactos(_artefactos)
	}
	
	method liberarEspacio() {
		artefactos.clear() // .clear vacia la coleccion 
	}
	
	method posee(artefacto) {
		return self.todasLasPosesiones().contains(artefacto)
	}
	
	method todasLasPosesiones() {
		return artefactos.union(hogar.baul()) //crea una nueva coleccion (SET) con las cosas que tiene encima y en el baul de la casa
	}
	
	method poderPelea() {
		return self.poderBase() + self.poderArtefactos()
	}
	
	method poderArtefactos() {
		return artefactos.sum({ artefacto => artefacto.poder(self) })
	}
	
	method batalla() {
		artefactos.forEach({ artefacto => artefacto.usar() }) //foreach solo para ordenes (mandar un mensaje)
		poderBase += 1
	}
	
	method enemigosVencibles(tierra) {
		return tierra.vencibles(self)
	}
	
	method vencibles(enemigo) {
		return enemigo.poderPelea() < self.poderPelea()
	}
	
	method tieneArmaFatal(enemigo) {
		return artefactos.any({ artefacto => self.esFatal(artefacto, enemigo)}) //.any() retorna true si alguno de los elementos cumple con la condicion
	}
	
	method esFatal(artefacto, enemigo) {
		return artefacto.poder(self) > enemigo.poderPelea()
	}
}
