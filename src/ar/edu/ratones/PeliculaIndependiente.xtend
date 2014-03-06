package ar.edu.ratones

import ar.edu.ratones.Pelicula

class PeliculaIndependiente extends Pelicula {
	
	override getPersonajesPagos() {
		personajes.take(4).toList
	}
	
}