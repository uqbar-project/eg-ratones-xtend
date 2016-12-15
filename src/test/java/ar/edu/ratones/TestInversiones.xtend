package ar.edu.ratones

import org.junit.Before
import org.junit.Test
import org.junit.Assert

class TestInversiones {

	Pelicula peliLocoPorMary
	Pelicula peliCarancho
	Pelicula peliNaufrago2
	Compania paramount
	ParqueDiversiones italPark
	RatonInversor darthMouse
	RatonInversor ratonazo

	@Before
	def void init() {
		peliLocoPorMary = new Pelicula(40000d, 4000d) => [
			agregarPersonaje(new Personaje("Cameron Diaz", 200))	
			agregarPersonaje(new Personaje("Matt Dillon", 350))
			agregarPersonaje(new Personaje("Ben Stiller", 1200))
			agregarPersonaje(new Personaje("Lee Evans", 180))
			agregarPersonaje(new Personaje("Chris Elliot", 240))
			agregarPersonaje(new Personaje("Lin Shaye", 60))
		]

		peliCarancho = new PeliculaIndependiente(10000d, 10d) => [
			agregarPersonaje(new Personaje("Ricardo Darin", 1000))
			agregarPersonaje(new Personaje("Loren Acuña", 15))
			agregarPersonaje(new Personaje("Martina Gusman", 50))
			agregarPersonaje(new Personaje("Jose Luis Arias", 20))
			agregarPersonaje(new Personaje("Fabio Ronzano", 5))
			agregarPersonaje(new Personaje("Carlos Weber", 40))
		]

		peliNaufrago2 = new Pelicula(30000d, 10000d) => [
			agregarPersonaje(new Personaje("Tom Hanks", 2500))
			agregarPersonaje(new Personaje("Paul Sanchez", 30))
		]

		paramount = new Compania(0.5d) => [
			agregarPelicula(peliLocoPorMary)
			agregarPelicula(peliCarancho)
		]

		ParqueDiversiones.costoPorMetroCuadrado = 20d
		italPark = new ParqueDiversiones(100, 3000d)

		darthMouse = new RatonInversor(100000d) => [
			agregarInversionPendiente(paramount)
			agregarInversionPendiente(italPark)
		]
		ratonazo = new RatonInversor(100d)
		ratonazo.agregarInversionPendiente(peliNaufrago2)
	}

	@Test
	def void costoNaufrago2() {
		Assert.assertEquals(12530d, peliNaufrago2.costo, 0.01)
	}

	@Test
	def void costoCarancho() {
		Assert.assertEquals(10d, peliCarancho.costoProduccion, 0.01)
		Assert.assertEquals(1110d, peliCarancho.costoPersonajes, 0.01)
		Assert.assertEquals(1120d, peliCarancho.costo, 0.01)
	}

	@Test
	def void costoItalpark() {
		Assert.assertEquals(5000d, italPark.costo, 0.01)
	}

	@Test
	def void costoParamount() {
		Assert.assertEquals(25000d, paramount.costo, 0.01)
	}

	@Test
	def void costoInversionesPendientesDarthMouse() {
		Assert.assertEquals(30000d, darthMouse.costoInversionesPendientes, 0.01)
	}

	@Test
	def void realizarInversionesPendientesDarthMouse() {
		Assert.assertTrue(darthMouse.realizarInversionesPendientes)
		Assert.assertEquals(0, darthMouse.inversionesPendientes.size)
		Assert.assertEquals(2, darthMouse.inversionesRealizadas.size)
	}

	@Test
	def void realizarInversionesPendientesRatonazo() {
		Assert.assertFalse(ratonazo.realizarInversionesPendientes)
		Assert.assertEquals(1, ratonazo.inversionesPendientes.size)
		Assert.assertEquals(0, ratonazo.inversionesRealizadas.size)
	}

	@Test
	def void realizarInversionesPendientesDarthMousePobreton() {
		darthMouse.dineroDisponible = 10000d 
		Assert.assertFalse(darthMouse.realizarInversionesPendientes)
		Assert.assertEquals(2, darthMouse.inversionesPendientes.size)
		Assert.assertEquals(0, darthMouse.inversionesRealizadas.size)
	}

}
