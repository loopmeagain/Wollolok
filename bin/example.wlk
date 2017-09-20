object mapa{
	var aguaTerrain
	method esAgua(unaCoordenada)= aguaTerrain.contains(unaCoordenada)
	method tierraMasCercana(unaUbicacion){}	
}
class Unidad 
{
	var ubicacion
	var salud
	var resistenciaProyectiles
	var estadoTextura
	method suprimir()
			{
			estadoTextura=new EstructuraDestruida()
			estadoTextura.suprimir(self)
			}
	method modificarSalud(unValor){	salud+=unValor}
	method get_salud()=salud
	method mover(unaCoord) { ubicacion=unaCoord}
	method get_ubicacion()=ubicacion
}
//
class Coordenada
{
		var x
		var y
	constructor(unX,unY){ x=unX ; y=unY}
		method get_x()=x
		method get_y()=y
		method cambiarCoord(unValorDeX,unValorDeY)
			{
				x=unValorDeX
				y=unValorDeY
			}
		method distancia(unaCoordenada)= 
((self.get_x()-unaCoordenada.get_x()).pow(2)+(self.get_y()-unaCoordenada.get_y()).pow(2)).sqrt()
		//distancia en r2
		method esAgua()= mapa.esAgua(self)
		method tierraMasCercana(unaUbicacion){ mapa.tierraMasCercana(unaUbicacion)}
			
		
}
// si, repiten logica porque la idea era representar el cambio de texturas, tal vez sea algo excesivo mdoelar esto
//mejor lo simulamos con strings antes de hacer esto que es horrible?
class Estado {
	method suprimir(unaUnidad){}
}
// probablemente tenga que modelar las acciones  y debuffs como estados
class EstructuraDestruida inherits Estado
{
	override method suprimir(unaUnidad)
		{ 	unaUnidad.modificarSalud(-unaUnidad.get_salud())	
			unaUnidad.mover(new Coordenada(0,0))	
		}
}
class UnidadDestruida inherits Estado
	{
		override method suprimir(unaUnidad)
		{
			unaUnidad.modificarSalud(-unaUnidad.get_salud())	
			unaUnidad.mover(new Coordenada(0,0))	
		}
	}
class UnidadTerrestre inherits Unidad
{
	var velocidadMovimiento
	var danioAtaque
	var rango
	override method mover(unaUbicacion)
	{
		if(unaUbicacion.esAgua())
		{ubicacion=unaUbicacion.tierraMasCercana()}
		else { super(unaUbicacion)}
	}
	method atacar(unaUnidad)
	{	if(self.get_ubicacion().distancia(unaUnidad.get_ubicacion())<=rango)
		unaUnidad.modificarSalud(-danioAtaque)
		else{
			self.mover(self.get_ubicacion().distancia(unaUnidad.get_ubicacion())-rango)
		}
	}
	method domesticarOvejas(){}//interesante cosa para modelar
	//probablemente convenga modelar las acciones como clases para que pueda cambiar las que se loopean
	method patrullar(unaUbicacion)
 	{
 		self.mover(unaUbicacion)
 		
	 }
}
 
class Estructura inherits Unidad
{}

class Mejora{}



class UnidadAcuatica inherits UnidadMovil{}