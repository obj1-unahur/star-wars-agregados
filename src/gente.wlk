class Persona {
	var property edad = 18
	method valor() { return self.potencia() + self.inteligencia() }	
	method inteligencia() { 
		if (edad.between(20,40)) { return 12 } else { return 8 } 
	}
	method potencia() { return 20 }
	method esDestacado() { return edad == 25 or edad == 35 }
}

class Atleta inherits Persona {
	var property masaMuscular = 4
	var property tecnicasQueConoce = 2 
	override method potencia() { return super() + masaMuscular * tecnicasQueConoce }
	method entrenar(dias) { masaMuscular += dias / 5 }
	method aprenderTecnica() { tecnicasQueConoce += 1 }
	override method esDestacado() { return super() or tecnicasQueConoce > 5 }
	method contribuir(ciudad) { }
}

class Docente inherits Persona {
	var property cantidadDeCursosQueDio = 0
	override method inteligencia() { return super() + cantidadDeCursosQueDio * 2 }
	override method esDestacado() { return cantidadDeCursosQueDio > 3 }
	method contribuir(ciudad) { ciudad.fundarMuseo() }
}

class Soldado inherits Persona {
	var armas = []
	override method potencia() { return super() + armas.sum({arma => arma.potencia(self)})}
	override method esDestacado() { return armas.find({arma => arma.potencia() >= 15})}
	method contribuir(ciudad) { ciudad.construirMurallas(5) }
}

class Pistolete {
	var property largo = 12
	method potencia(soldado) {
		if (soldado.edad() > 30) { return largo * 3} else { return largo * 2 } 
	}
}

class Espadon {
	var property peso = 20 
	method potencia(soldado) { 
		if (soldado.edad() < 40) { return peso / 2 } else { return 6 }
	}
}

class Planeta {
	var habitantes = []
	var cantidadMuseos = 0
	var longitudMurallas = 0
	
	method construirMurallas(cantidad) { longitudMurallas += cantidad }
	method fundarUnMuseo() { cantidadMuseos += 1 }
	method recibirTributos() { habitantes.forEach({hab => hab.contribuir(self)}) }
	method esCulto() { return cantidadMuseos > 2 and habitantes.all({ hab => hab.inteligencia() > 10 })}
	method potenciaAparente() { return self.maximaPotencia() * habitantes.size() }
	method maximaPotencia() { return habitantes.max({ hab => hab.potencia() }).potencia() }
	method potenciaReal() { return habitantes.sum({ hab => hab.potencia() }) }
	method delegacionDiplomatica() { return habitantes.filter({ hab => hab.esDestacado() })}
}
