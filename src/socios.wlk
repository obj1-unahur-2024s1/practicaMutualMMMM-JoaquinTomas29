import example.*
class Socios{
	const actividades = []
	var maxActividades
	var edad
	const  idiomas = #{}
	method esFanDelSol() = actividades.all({a => a.broncearse()})
	method actividadesEsforzadas() = actividades.filter({a => a.implicaEsfuerzo()})
	method realzarActividad(unaActividad){
		if(actividades.size() == maxActividades){
			self.error("alcanzo al maximo de actividades")
		}
		actividades.add(unaActividad)
	}
method leAtraeAlSocio(unaActividad)
method realizoActividad(unaActividad) = actividades.contains(unaActividad)
}
class SocioTranquilo inherits Socios{
	override method leAtraeAlSocio(unaActividad) = unaActividad.cantDias() >= 4
}

class SocioCoherente inherits Socios{
	override method leAtraeAlSocio(unaActividad) = if (self.esFanDelSol()) unaActividad.broncearse() else unaActividad.implicaEsfuerzo()
}

class SocioRelajado inherits Socios{
	override method leAtraeAlSocio(unaActividad) = not idiomas.intersection(unaActividad.idiomas()).isEmpty()
}