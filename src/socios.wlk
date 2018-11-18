
class Socio {
	var property actividadesRealizadas = []
	var property maxActividades
	var property edad
	var idiomas = []
	var property tipo = tranquilo
		
	method adoraElSol() = actividadesRealizadas.all{act => act.bronceado()} 
	
	method actividadesEsforzadas() = actividadesRealizadas.filter{act => act.esfuerzo()}
	
		
	method realizarActividad(actividadNueva){
		if (actividadesRealizadas.size() >= maxActividades)
			throw new Exception("No se pueden agregar más actividades")
		actividadesRealizadas.add(actividadNueva)
	}
	
	method leAtrae(actividad) = tipo.atractivaPara(actividad,self)
	
	method habla(idioma) = idiomas.contains(idioma)
	
	method hizo(actividad) = actividadesRealizadas.contains(actividad)
}

object tranquilo{
	method atractivaPara(actividad,socio) = actividad.dias() > 3
}

object coherente { 
	method atractivaPara(actividad,socio) = 
		if (socio.adoraElSol()) actividad.bronceado() else actividad.esfuerzo()
}

object relajado{
	method atractivoPara(actividad,socio) =  
		actividad.idiomas().any{idioma=>socio.habla(idioma)} 
	
}