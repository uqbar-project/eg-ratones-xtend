package ar.edu.ratones

import ar.edu.ratones.Pelicula

class PeliculaIndependiente extends Pelicula {
	
	override getPersonajesPagos() {
		personajesOrdenadosPorSueldo.take(4).toList
	}
	
	def getPersonajesOrdenadosPorSueldo() {
		personajes.sortBy [ sueldo ]
	}
	
}