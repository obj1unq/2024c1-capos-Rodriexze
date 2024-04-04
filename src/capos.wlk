import artefactos.*
import castillo.*

object rolando {
	
	var capacidad = 2
	const property artefactos = #{}
	var hogar = castilloDePiedra
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
}
