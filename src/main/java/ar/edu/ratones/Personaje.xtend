package ar.edu.ratones

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Personaje {

	String nombre
	double sueldo
	
	/**
	 * *****************************************************************
	 * INICIALIZACION
	 * *****************************************************************
	 */
	new(String unNombre, double unSueldo) {
		nombre = unNombre
		sueldo = unSueldo
	}
		
}