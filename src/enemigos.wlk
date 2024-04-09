object erethia {
	
	var property enemigos = #{archivaldo, caterina, astra}
	
	method vencibles(capo) {
		return enemigos.filter({ enemigo => enemigo.poderPelea() < capo.poderPelea() }) // filtra una coleccion y genrera una nueva con la condicion establecida
	}
	
	method hogaresConquistables(capo) {
		return self.vencibles(capo).map({ enemigo => enemigo.hogar() }).asSet() //.map() siempre devuelve una lista
	}
	
	method esPoderoso(capo) {
		return enemigos.all({ enemigo => capo.vencible(enemigo) }) //devuelve true si cada elemento cumple con la condicion
	}
}

object archivaldo {
	
	var property hogar = palacioDeMarmol
	
	method poderPelea() {
		return 16
	}
}

object caterina {
	
	var property hogar = fortalezaDeAcero
	
	method poderPelea() {
		return 28
	}
}

object astra {
	
	var property hogar = torreDeMarfil
	
	method poderPelea() {
		return 14
	}	
}
