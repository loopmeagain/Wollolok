class Cancion {
	var letra = [ ]
	var duracion
	
	constructor (unaLetra,unaDuracion) {
		letra = unaLetra
		duracion = unaDuracion
	}
	
	method duracion() {
		return duracion
	}
	
	method letra() {
		return letra
	}
	
}
object lunaPark{
	var capacidad = 9290
	
	method capacidad(fecha) = capacidad
}

object laTrastienda{
	
	method capacidad(fecha) =
		if(fecha.dayOfWeek() == 6){
			return 700
		}else{
			return 400
		}
}
class Grupo {
	var nombre
	var integrantes = [ ]

	constructor(unNombre, losIntegrantes){
		nombre = unNombre
		integrantes = losIntegrantes
	}
	
	method nombre() = nombre
	method integrantes() = integrantes
	method costo(presentacion) = self.integrantes().sum({integrante => integrante.cuantoCobra(presentacion)})

}
class Gibson {
	var estado
	constructor(unEstado){
		estado = unEstado
	}
	method estado() = estado
	method unidadesGuitarra() =
		if(self.estado() == "Rota"){
			return 5
		}else{
			return 15
		}

}

object fender{
	var unidadesGuitarra = 10
	var estado = "Sana"
	
	method unidadesGuitarra() = unidadesGuitarra
	method estado() = estado
}
object joaquin {
	var habilidad = 20
	var grupo
	
	method habilidad() = habilidad
	method grupo() = grupo
	
	method asignarGrupo() {
		grupo = ""
		habilidad = 20
	}
	
	method asignarGrupo(unGrupo) {
		grupo = unGrupo.nombre()
		habilidad = 25
	}
	
	
	method interpretaBien(cancion) {
		return cancion.duracion() > 300
	}
	
	method cuantoCobra(presentacion) =
		if(presentacion.grupo().integrantes() == [self]){
			return 100
		}else{
			return 50
		}
}

object luisAlberto {
	var habilidad
	var instrumento
	
	method habilidad() = habilidad
	
	method cambiarGuitarra(guitarra){
		instrumento = guitarra
		habilidad = 100.min(8 * guitarra.unidadesGuitarra())
	}

	method interpretaBien(cancion) = return true
	
	method cuantoCobra (presentacion) {
		if ( presentacion.fecha() < new Date (30, 9, 2017) ) {
		return 1000	
		}
		else{
		return 1200	
		}
	}
}


object lucia {
	var habilidad
	var grupo
	
	method habilidad() = habilidad
	method grupo() = grupo
	
	method asignarGrupo() {
		grupo = ""
		habilidad = 70
	}
	
	method asignarGrupo(unGrupo) {
		grupo = unGrupo.nombre() 
		habilidad = 50
		}
	
	method interpretaBien(cancion) = 
		return cancion.letra().any({palabra => palabra.toLowerCase() == "familia"})
	
	method cuantoCobra (presentacion) = 
		if(presentacion.capacidad() > 5000){
			return 500
			}else{
			return 400
			}
	}


class Presentacion
{
	var fecha 
	var teatro
	var grupo
	
	constructor (unDia, unMes, unAnio, unTeatro, grupoQueToca) {
		fecha = new Date(unDia, unMes, unAnio)
		teatro = unTeatro
		grupo = grupoQueToca
	}
	
	
	method fecha() = fecha
	method teatro() =  teatro
	method grupo() = grupo
	method costo() = self.grupo().costo(self)
	method capacidad() = self.teatro().capacidad(self.fecha())
}