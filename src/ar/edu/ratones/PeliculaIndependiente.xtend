package ar.edu.ratones

import ar.edu.ratones.Pelicula

class PeliculaIndependiente extends Pelicula {
	
	/**
	 * *****************************************************************
	 * INICIALIZACION
	 * *****************************************************************
	 */
	new(double recaudacion, double costoProduccion) {
		super(recaudacion, costoProduccion)
	}

	/**
	 * *****************************************************************
	 * PUNTO 1
	 * *****************************************************************
	 */	
	override getPersonajesPagos() {
		personajesOrdenadosPorSueldo.take(4).toList
	}
	
	def getPersonajesOrdenadosPorSueldo() {
		personajes.sortBy [ -sueldo ]
	}
	
}