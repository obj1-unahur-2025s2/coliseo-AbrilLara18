import gladiadores.*

class ArmasFilo{
    var longitud=0
    var filo=0
    method esFilosa(){
        filo=1
    }
    method noEsFilosa(){
        filo=0
    }
    method definirLongitud(num){
        longitud=num
    }
    method daño(){
        return longitud*filo
    }
}
class ArmasContundentes {
  var peso=0
  method definirPeso(num) {
    peso=num
  }
  method daño(){
    return peso
  }
}

object casco {
  method defensa(protador){
    return 10
  }
}
object escudo {
  method defensa(portador) {
    return 5 + portador.destreza()*0.10
  }
}