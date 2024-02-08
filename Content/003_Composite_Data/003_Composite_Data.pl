% Listas
%
% Uma lista é:
% -empty
% -cons(X,Y), onde X->termo qualquer e Y->lista


% lista is semidet.
%
% True se X é uma lista.
lista(empty).
lista(cons(_,Y)):-lista(Y).

% Também podemos representar uma lista, com uma notação mais amigável.
%
%L0=[].
%L1=[1,2].
%L2=[3,4].

% Composição
%
%  - Podemos utilizar uma lista já existente para definir outra lista.
%
%  X = [1, 2, 3], Y = ’.’(5, X).
%
%  Ou utilizar uma sintaxe mais amigável
%
%  X = [1, 2, 3], Y = [ 5 | X ], Z = [3, 4 | X].
%
%  A notação [ A | B ] é equivalente a ’.’(A, B).
%
%  X = ’.’(3, ’.’(4, [])), Y = [3 | [4 | []]], Z = [3, 4].
%
%
% Decomposiçao
%
% Como obter os componentes de uma lista?
% Da mesma forma que obtemos os componentes de outras estruturas,
% utilizando 'unificaçao'.
%
% Oservacao: A lista é um termo, logo pode ser utilizado da mesma forma
% que qualquer outro termo
%
% [A|B] = [1,3,7].
% [A,B|C] = [3,6,7].
% [A,B,C] = [2,5,8].
