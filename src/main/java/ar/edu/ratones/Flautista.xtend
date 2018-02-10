package ar.edu.ratones

import java.util.HashSet
import java.util.Set

class Flautista {
	
	Set<RatonInversor> ratones = new HashSet
	
	/**
	 * *****************************************************************
	 * INICIALIZACION
	 * *****************************************************************
	 */
	def void agregarRaton(RatonInversor raton) {
		ratones.add(raton) 
	}
	
	/**
	 * *****************************************************************
	 * PUNTO 5.2
	 * *****************************************************************
	 */
	def void tocar() {
		ratonesAmbiciosos.forEach [ raton | raton.dilapidarCapital ]
	}
	
	def getRatonesAmbiciosos() {
		ratones.filter [ raton | raton.esAmbicioso ].toSet
	}
	
}