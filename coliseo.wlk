import gladiadores.*
import armas.*
import grupos.*

object coliseo {
  const gruposLuchadores=#{}
  method agregarGrupo(nuevo) {
    gruposLuchadores.add(nuevo)
  }
    method curarGladiadores(luchador,vida) {
      luchador.curarse(vida)
    }
    method combateEntreY(luchador1,luchador2) {
      luchador1.atacarA(luchador2)
    }
}