class Viaje {
	var property idiomas = []
	
	method dias() = 0
	method esfuerzo() = false
	method bronceado() = false

	method esInteresante() = idiomas.size() > 1
	
	method seRecomiendaA(socio) =
		self.esInteresante() and
		socio.leAtrae(self) and
		not socio.hizo(self)
}

class ViajePlaya inherits Viaje{
	var property largoPlaya
	override method dias() = largoPlaya/500
	override method esfuerzo() = largoPlaya >1200
	override method bronceado() = true
}

class ViajeCiudad inherits Viaje{
	var property atracciones
	override method dias() = atracciones/2
	override method esfuerzo() = atracciones > 5
//	override method bronceado() = false
	override method esInteresante() = super() or atracciones==5	
}

class ViajeCiudadTrop inherits ViajeCiudad{
	override method dias() = super() + 1
	override method bronceado() = true
}

class ViajeTrekking inherits Viaje{
	var property kilometros
	var property diasSol
	override method dias() = kilometros/50
	override method esfuerzo() = kilometros>80
	override method bronceado() = diasSol>200 or (diasSol>=100 and kilometros>120)
	override method esInteresante() = super() and diasSol>140
}


class ClaseGimnasia {
	method idiomas() = ["espaniol"]
	method dias() = 1
	method esfuerzo() = true
	method bronceado() = false
	
	method seRecomiendaA(socio) = socio.edad().between(20,30)
}
