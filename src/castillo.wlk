import capos.*
import artefactos.*

object castilloDePiedra {
	
	const property baul = #{}
	
	method guardarArtefactos(artefactos) {
		baul.addAll(artefactos)
	}
	
	method poderInvocacion(personaje) {
		return if (not baul.isEmpty() ) baul.max({ artefacto => artefacto.poder(personaje) }).poder(personaje) else 0
	} 
}
