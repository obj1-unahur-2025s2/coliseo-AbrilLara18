import armas.*
import grupos.*

class Mirmillones {
  var vida=100
  var arma= new ArmasFilo()
  var armadura= casco
  var fuerza=0
  method cambiarArma(armaNueva){
    arma=armaNueva
  }
  method cambiarArmadura(armaduraNueva){
    armadura=armaduraNueva
  }
  method definirFuerza(num){
    fuerza=num
  }
  method fuerza(){
    return fuerza
  }
  method destreza() {
    return 15
  }
  method defensa(){
    return armadura.defensa() + self.destreza()
  }
  method vida() {
    return vida
  }
  method poderAtaque(){
    return arma.daño()+fuerza
  }

  method puedeInfligirDaño(persona) {
    return self.poderAtaque() > persona.defensa()
  }

  method estaVivo() {
    return vida >0
  }
  method dañoInfligidoA(persona){
    return self.poderAtaque()-persona.defensa()
  }
  method atacarA(persona) {
    if (self.puedeInfligirDaño(persona) && persona.estaVivo()){
    persona.perderVida(self.dañoInfligidoA(persona))
    persona.atacarA(self)
    }
  }
  method perderVida(daño) {
    vida = (vida-daño).max(0)
  }
    method curarse() {
      vida=100
    }
  
  method crearGrupo(otroGladiador){
    new Grupo(nombre="mirmillolandia",integrantes=#{self,otroGladiador})
  }
}
class Dimachareus {
  var vida=100
  const arma= []
  var destreza=0
  method agregarArma(armaNueva){
    arma.add(armaNueva)
  }
  method definirDestreza(num){
    destreza=num
  }
  method fuerza(){
    return 10 
  }
  method destreza() {
    return destreza
  }
  method defensa(){
    return destreza/2
  }
  method vida() {
    return vida
  }
  method poderAtaque(){
    return arma.sum({a=>a.daño()})+self.fuerza()
  }
  method dañoInfligidoA(persona){
    return self.poderAtaque()-persona.defensa()
  }
    method puedeInfligirDaño(persona) {
    return self.poderAtaque() > persona.defensa()
  }

  method estaVivo() {
    return vida >0
  }
  method atacarA(persona) {
    if (self.puedeInfligirDaño(persona) && persona.estaVivo()){
    persona.perderVida(self.dañoInfligidoA(persona))
    persona.atacarA(self)
    destreza+=1
    }
  }
  method perderVida(daño) {
    vida = (vida-daño).max(0)
  }
    method curarse() {
      vida=100
    }
  method crearGrupo(otroGladiador){
    new Grupo(nombre="D-"+(self.poderAtaque()+otroGladiador.poderAtaque()).toString(),integrantes=#{self,otroGladiador})
  }
}