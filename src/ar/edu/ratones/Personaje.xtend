package ar.edu.ratones

class Personaje {

	@Property String nombre
	@Property double sueldo
	
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