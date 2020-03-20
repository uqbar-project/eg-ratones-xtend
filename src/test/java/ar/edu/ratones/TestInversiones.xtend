package ar.edu.ratones

import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Nested
import org.junit.jupiter.api.Test

import static ar.edu.ratones.ParqueDiversiones.*
import static org.junit.jupiter.api.Assertions.assertEquals
import static org.junit.jupiter.api.Assertions.assertFalse
import static org.junit.jupiter.api.Assertions.assertTrue

@DisplayName("Ejemplo Ratones inversores")
class TestInversiones {

	@Nested
	@DisplayName("Dada una película común")
	static class CasoPeliculaComun {
		Personaje tomHanks = RatonesInversoresFactory.tomHanks
		Personaje paulSanchez = RatonesInversoresFactory.paulSanchez
		Pelicula peliNaufrago2

		@BeforeEach
		def void init() {
			peliNaufrago2 = RatonesInversoresFactory.peliComun
		}

		@Test
		@DisplayName("su costo es la suma del costo de producción y lo que cobraron los actores")
		def void costoNaufrago2() {
			assertEquals(12530d, peliNaufrago2.costo, 0.01)
		}

		@Test
		@DisplayName("los personajes involucrados es la lista completa de personajes que participan")
		def void personajesNaufrago() {
			assertEquals(#[tomHanks, paulSanchez], peliNaufrago2.personajesInvolucrados)
		}

	}

	@Nested
	@DisplayName("Dada una película independiente")
	static class CasoPeliculaIndependiente {
		Pelicula peliCarancho

		@BeforeEach
		def void init() {
			peliCarancho = RatonesInversoresFactory.peliIndependiente
		}

		@Test
		@DisplayName("su costo es el costo de producción y el costo de los primeros n personajes")
		def void costoCarancho() {
			assertEquals(10d, peliCarancho.costoProduccion, 0.01)
			assertEquals(1110d, peliCarancho.costoPersonajes, 0.01)
			assertEquals(1120d, peliCarancho.costo, 0.01)
		}
	}

	@Nested
	@DisplayName("Dado un parque de diversiones")
	static class CasoParqueDiversiones {
		ParqueDiversiones italPark

		@BeforeEach
		def void init() {
			ParqueDiversiones.costoPorMetroCuadrado = 20d
			italPark = new ParqueDiversiones(100, 3000d)
		}

		@Test
		@DisplayName("su costo está en base a las atracciones y a los metros cuadrados")
		def void costoItalpark() {
			assertEquals(5000d, italPark.costo, 0.01)
		}

		@Test
		@DisplayName("no tiene personajes involucrados")
		def void personajesInvolucradosItalpark() {
			assertEquals(#[], italPark.personajesInvolucrados)
		}
	}

	@Nested
	@DisplayName("Dada una compañía que produce películas")
	static class CasoCompania {
		Compania paramount

		@BeforeEach
		def void init() {
			paramount = RatonesInversoresFactory.compania
		}

		@Test
		@DisplayName("su costo está en base al % de la recaudación de las películas que produce")
		def void costoParamount() {
			assertEquals(25000d, paramount.costo, 0.01)
		}
	}

	@Nested
	@DisplayName("Dado un ratón inversor común")
	static class CasoRatonInversorComun {
		RatonInversor darthMouse

		@BeforeEach
		def void init() {
			darthMouse = RatonesInversoresFactory.ratonInversorComun
		}

		@Test
		@DisplayName("su costo de inversiones pendientes es la suma de inversiones que no se concretaron")
		def void costoInversionesPendientesDarthMouse() {
			assertEquals(30000d, darthMouse.costoInversionesPendientes, 0.01)
		}

		@Test
		@DisplayName("al realizar las inversiones pendientes realiza solo las que puede")
		def void realizarInversionesPendientesDarthMouse() {
			assertTrue(darthMouse.realizarInversionesPendientes)
			assertEquals(0, darthMouse.inversionesPendientes.size)
			assertEquals(2, darthMouse.inversionesRealizadas.size)
		}

	}

	@Nested
	@DisplayName("Dado un ratón inversor común con poca plata")
	static class CasoRatonInversorComunConPocaPlata {
		RatonInversor darthMouse

		@BeforeEach
		def void init() {
			darthMouse = RatonesInversoresFactory.ratonInversorComunPobreton
		}

		@Test
		@DisplayName("al intentar realizar las inversiones pendientes no puede hacer ninguna")
		def void realizarInversionesPendientesDarthMousePobreton() {
			assertFalse(darthMouse.realizarInversionesPendientes)
			assertEquals(2, darthMouse.inversionesPendientes.size)
			assertEquals(0, darthMouse.inversionesRealizadas.size)
		}

	}

	@Nested
	@DisplayName("Dado un ratón inversor ambicioso")
	static class CasoRatonInversorAmbicioso {
		RatonInversor ambicioso
		
		@BeforeEach
		def void init() {
			ambicioso = RatonesInversoresFactory.ratonInversorAmbicioso
		}

		@Test
		@DisplayName("no realiza inversiones si no tiene suficiente plata")
		def void realizarInversionesPendientesAmbicioso() {
			assertEquals(1, ambicioso.inversionesPendientes.size)
			assertEquals(0, ambicioso.inversionesRealizadas.size)
			ambicioso.realizarInversionesPendientes
			assertEquals(1, ambicioso.inversionesPendientes.size)
			assertEquals(0, ambicioso.inversionesRealizadas.size)
		}

	}

	@Nested
	@DisplayName("Dado un flautista de Hamelin")
	static class CasoFlautistaHamelin {
		Flautista hamelin = RatonesInversoresFactory.flautistaHamelin
		RatonInversor ambicioso = RatonesInversoresFactory.ratonInversorAmbicioso

		@Test
		@DisplayName("al tocar hace que un ratón ambicioso dilapide su fortuna")
		def void ratonesAmbiciososDilapidanFortunaDeHamelin() {
			assertEquals(0, ambicioso.costoInversionesRealizadas, 0.001)
			ambicioso.agregarInversionPendiente(new ParqueDiversiones(1, 10d))
			hamelin.tocar
			assertEquals(30, ambicioso.costoInversionesRealizadas, 0.001)
		}

		@Test
		@DisplayName("conoce qué ratones son ambiciosos")
		def void ratonesAmbiciososDeHamelin() {
			assertEquals(#{ambicioso}, hamelin.ratonesAmbiciosos)
		}
	}

}

class RatonesInversoresFactory {

	public static Personaje tomHanks = new Personaje("Tom Hanks", 2500)
	public static Personaje paulSanchez = new Personaje("Paul Sanchez", 30)
	public static RatonInversor ambicioso

	private static def peliLocoPorMary() {
		new Pelicula(40000d, 4000d) => [
			agregarPersonaje(new Personaje("Cameron Diaz", 200))
			agregarPersonaje(new Personaje("Matt Dillon", 350))
			agregarPersonaje(new Personaje("Ben Stiller", 1200))
			agregarPersonaje(new Personaje("Lee Evans", 180))
			agregarPersonaje(new Personaje("Chris Elliot", 240))
			agregarPersonaje(new Personaje("Lin Shaye", 60))
		]
	}

	static def peliIndependiente() {
		new PeliculaIndependiente(10000d, 10d) => [
			agregarPersonaje(new Personaje("Ricardo Darin", 1000))
			agregarPersonaje(new Personaje("Loren Acuña", 15))
			agregarPersonaje(new Personaje("Martina Gusman", 50))
			agregarPersonaje(new Personaje("Jose Luis Arias", 20))
			agregarPersonaje(new Personaje("Fabio Ronzano", 5))
			agregarPersonaje(new Personaje("Carlos Weber", 40))
		]
	}

	static def peliComun() {
		new Pelicula(30000d, 10000d) => [
			agregarPersonaje(tomHanks)
			agregarPersonaje(paulSanchez)
		]
	}

	static def parqueDiversiones() {
		ParqueDiversiones.costoPorMetroCuadrado = 20d
		new ParqueDiversiones(100, 3000d)
	}

	static def compania() {
		new Compania(0.5d) => [
			agregarPelicula(peliLocoPorMary)
			agregarPelicula(RatonesInversoresFactory.peliIndependiente)
		]
	}

	static def ratonInversorComun() {
		new RatonInversor(100000d) => [
			agregarInversionPendiente(compania)
			agregarInversionPendiente(parqueDiversiones)
		]
	}

	static def ratonInversorComunPobreton() {
		ratonInversorComun => [
			dineroDisponible = 10000d
		]
	}

	static def ratonInversorAmbicioso() {
		// lazy initialization
		if (ambicioso === null) {
			ambicioso = new RatonInversor(100d)
		}
		ambicioso => [
			inversionesPendientes = newArrayList => [
				add(RatonesInversoresFactory.peliComun)
			]
			inversionesRealizadas = newArrayList
		]
	}

	static def flautistaHamelin() {
		new Flautista => [
			agregarRaton(ratonInversorComun)
			agregarRaton(ratonInversorAmbicioso)
		]
	}


}
