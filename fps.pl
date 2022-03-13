dano(classic, cabeca, 78).
dano(classic, peito, 26).
dano(classic, pernas, 22).
dano(stinger, cabeca, 67).
dano(stinger, peito, 27).
dano(stinger, pernas, 22).
dano(vandal, cabeca, 160).
dano(vandal, peito, 40).
dano(vandal, pernas, 34).

final(Vida, Escudo):-
    (Vida < 0 -> write("Morreu"), VidaFinal is 0; write("Sobreviveu"), VidaFinal is Vida),
    nl,
    X is ceil(VidaFinal),
    Y is ceil(Escudo),     
    write("Vida: "), write(X), nl,
    write("Escudo: "), write(Y), nl, 
    halt.

verificarInimigo(0, classic, Vida, Escudo):- final(Vida, Escudo).
verificarInimigo(0, stinger, Vida, Escudo):- final(Vida, Escudo).
verificarInimigo(0, vandal, Vida, Escudo):- final(Vida, Escudo).


verificarInimigo(NumTiros, NomeArma, Vida, Escudo):-
    read(Local),
    dano(NomeArma, Local, DanoLocal),
    VidaRestante is Vida - (DanoLocal * 0.34),
    EscudoRestante is Escudo - (DanoLocal * 0.66),
    (EscudoRestante < 0 -> VidaFinal is VidaRestante + EscudoRestante, EscudoFinal is 0; VidaFinal is VidaRestante, EscudoFinal is EscudoRestante),
    NumTirosRestantes is NumTiros - 1,
    verificarInimigo(NumTirosRestantes, NomeArma, VidaFinal, EscudoFinal).

main:-
    read(NomeArma),
    read(NumTiros),
    verificarInimigo(NumTiros, NomeArma, 100, 50).
    