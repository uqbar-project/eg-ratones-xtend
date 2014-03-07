package ar.edu.ratones

import java.util.HashSet
import java.util.Set

class Flautista {
	
	Set<RatonInversor> ratones
	
	new() {
		ratones = new HashSet
	}
	
	def void tocar() {
		ratonesAmbiciosos.forEach [ raton | raton.dilapidarCapital ]
	}
	
	def getRatonesAmbiciosos() {
		ratones.filter [ raton | raton.esAmbicioso ]
	}
	
}