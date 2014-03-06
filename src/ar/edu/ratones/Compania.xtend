package ar.edu.ratones

import java.util.ArrayList
import java.util.List

class Compania implements Inversion {
	
	List<Pelicula> peliculas
	double porcentajeRecaudacion
	
	new() {
		porcentajeRecaudacion = 0.0
		peliculas = new ArrayList<Pelicula>
	}
	
	/**
	 * PUNTO 1
	 */
	override costo() {
		totalRecaudacion * porcentajeRecaudacion 
	}

	def getTotalRecaudacion() {
		peliculas.fold(0.0, [ acum, pelicula | acum + pelicula.recaudacion ])
	}
	
	/**
	 * PUNTO 2
	 */
	override personajesInvolucadros() {
		peliculas.fold(new ArrayList<Personaje>, 
			[ todos, pelicula | todos.addAll(pelicula.personajes) todos ])
	}
	
}
