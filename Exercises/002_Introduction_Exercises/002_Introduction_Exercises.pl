homem(albert).
homem(edward).
mulher(alice).
mulher(victoria).

% Primeiro argumento -> filho(a),
% Segundo argumento -> mae,
% Terceiro argumento -> pai.
%
pais(edward, victoria, albert).
pais(alice, victoria, albert).

irma(X, Y) :-
    mulher(X),
    pais(X, M, F),
    pais(Y, M, F).


% Como o Prolog responde a consulta irm� de (alice, X) ??
%
% Resposta:
%
% irma(alice, X).
% X = edward ;
% X = alice.



% Quest�o 2.2) Como o Prolog responde as seguintes consultas ?
% bruxo(rony).
% bruxa(rony).
% bruxa(hermione).
% bruxo(hermione).
% bruxo(harry).
% bruxo(Y).
% bruxa(Y).

% Fato
bruxo(rony).

% Regra
bruxo(X) :-
    possuiVassoura(X), possuiVarinha(X). % Possui vassoura ou possui varinha.


possuiVarinha(harry).
jogadorQuadribol(harry).

possuiVassoura(X) :- jogadorQuadribol(X).

% Quest�o 3) como o Prolog responde as seguintes consultas?
%
% likes(sam,dahl).
% likes(sam,chop_suey).
% likes(sam,pizza).
% likes(sam,chips).
% likes(sam,curry).

% Regra
% Comidas que 'sam' gosta.
%
likes(sam,Food) :- indian(Food), mild(Food). % Sam gosta de comida indiana e mild.
likes(sam,Food) :- chinese(Food). % Sam gosta de comida chinesa.
likes(sam,Food) :- italian(Food). % Sam gosta de comida italiana.
likes(sam,chips). % Sam gosta de chips.

% Fato
% Comida Indiana
%
indian(curry).
indian(dahl).
indian(tandoori).
indian(kurma).

% Fato
% Comida mild
%
mild(dahl).
mild(tandoori).
mild(kurma).

% Fato
% Comida Chinesa
%
chinese(chow_mein).
chinese(chop_suey).
chinese(sweet_and_sour).

% Fato
% Comidas italianas
%
italian(pizza).
italian(spaghetti).


% Quest�o 4) Quais dos seguintes par de termos unificam? Quando for o
% caso, de o valor instanciado para cada variavel que levou a unifica��o
%
% bread = bread -------------------------------------> true
% �Bread� = bread -----------------------------------> false
% �bread� = bread -----------------------------------> true
% Bread = bread -------------------------------------> Bread = bread
% bread = sausage -----------------------------------> false
% food(bread) = bread -------------------------------> false
% food(bread) = X -----------------------------------> X = food(bread).
% food(X) = food(bread) -----------------------------> X = bread.
% food(bread, X) = food(Y, sausage) -----------------> X = sausage, Y =
% bread.
%
% food(bread, X, beer) = food(Y, sausage, X) --------> false
% food(bread, X,beer) = food(Y, kahuna burger) ------> false
% meal(food(bread),drink(beer)) = meal(X,Y) --------> X = food(bread),
% Y = drink(beer).
%
% meal(food(bread), X) = meal(X,drink(beer)) --------> false



% Quest�o 5) Quantas regras, fatos, clausulas e predicados existem na
% seguinte base de conhecimento, Qual � a cabe�a de cada regra e quais
% s�o as metas que elas cont�m ?
%
% mulher(vincent). -----------------------> Fato
% mulher(mia). ---------------------------> Fato
% homem(jules). --------------------------> Fato
%
% pessoa(X) :- homem(X); mulher(X). ------> Regra
% Cabe�a: pessoa(X).
% Metas: homem(X) e mulher(X).

% ama(X, Y) :- pai(X, Y). ----------------> Regra
% Cabe�a: ama(X, Y).
% Metas: pa(X, Y).
%
% pai(Y, Z) :- homem(Y), filho(Z, Y). ----> Regra
% Cabe�a: pai(Y, Z).
% Metas: homem(Y) e filho(Z, Y).
%
% pai(Y, Z) :- homem(Y), filha(Z, Y). ----> Regra
% Cabe�a: pai(Y, Z).
% Metas: homem(Y) e filha(Z, Y).
%
% Portanto, 3 fatos, 4 regras = 7 clausulas.













