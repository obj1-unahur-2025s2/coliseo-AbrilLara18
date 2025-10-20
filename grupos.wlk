import gladiadores.*
import armas.*

class Grupo {
  var nombre=""
  const integrantes=#{}
  var cantPeleas=0

    method curarse() {
      integrantes.forEach({l=>l.curarse()})
    }
    method agregarLuchador(luchador){
        integrantes.add(luchador)
    }
    method sacarLuchador(luchador){
        integrantes.remove(luchador)
    }
    method losQueEstanVivos(){
        return integrantes.filter({l=>l.estaVivo()})
    }

    method hayAlgunGladiadorVivo() {
      return integrantes.any({l=>l.estaVivo()})
    }
    method campeon(){
        return self.losQueEstanVivos().max({l=>l.poderAtaque()})
    }

    method atacarA(enemigo){
      if(self.hayAlgunGladiadorVivo() && enemigo.hayAlgunGladiadorVivo()){
        self.campeon().atacarA(enemigo.campeon())
        self.campeon().atacarA(enemigo.campeon())
        self.campeon().atacarA(enemigo.campeon())
       self.registrarPelea()
       enemigo.registrarPelea()
      }

    }

    method registrarPelea(){
      cantPeleas+=1
    }
    method cantPeleas() {
      return cantPeleas
    }
    method cambiarNombre(nombreNuevo) {
      nombre=nombreNuevo
    }
}
