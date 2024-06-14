import socios.*
class Viajes{
	const property idiomas = #{}

	method implicaEsfuerzo()
	method broncearse()
	method cantDias()
	method esInteresante() = idiomas.size() > 1
	method esRecomendada(unSocio) {return self.esInteresante() and unSocio.leAtraeAlSocio(self) and not unSocio.realizoActividad(self)}
}
class ViajeDePlaya inherits Viajes{
	const property largo
	override method cantDias(){return largo / 500}
	override method implicaEsfuerzo() = largo > 1200
	override method  broncearse() = true
}

class ExcursionCiudad inherits Viajes{
	const property cantAtracciones
	override method cantDias(){return cantAtracciones / 2}
	override method  broncearse() = false
	override method implicaEsfuerzo() = cantAtracciones.between(5,8)
	override method esInteresante() = super() or cantAtracciones == 5
}
class ExcursionCiudadTropical inherits ExcursionCiudad{
	override method  broncearse() = true
	override method cantDias(){return super() + 1}
}
class SalidaDeTrekking inherits Viajes{
	const property klmSendero
	const property cantDiasSol
	override method cantDias(){return klmSendero / 50}
	override method implicaEsfuerzo() = klmSendero >= 80
	override method  broncearse() = cantDiasSol > 200 or (cantDiasSol.betwewn(100,200) and klmSendero > 120)
	override method esInteresante() = super() and cantDiasSol > 140
}
class ClasesDeGim inherits Viajes{
	override method cantDias() = 1
	override method implicaEsfuerzo() = true
	override method  broncearse() = false
	method initialize(){
		 if(idiomas !=#{"español"}){self.error("solo se permite clase de gimnasia en español")}
	} 
	
}




