% Retrocesso

% Defina um predicado selecionado(?N, ?L, ?R) que e verdadeiro a lista R
% e a como a lista L mas sem o elemento N.
selecionado(X, [X|T], T).
selecionado(X, [H|T], [H|R]) :-
    selecionado(X, T, R).

% Defina um predicado permutacao(+L, ?P) que e verdadeiro se a lista P
% e uma permutacao da lista L.
permutacao([],[]).
permutacao(L, [X|P]) :-
    selecionado(X,L, R),
    permutacao(R, P).


% Geradores
% Predicados que produzem mais de uma resposta.
% As vezes e interessante ter predicados que são satisfeitos infinitas
% vezes. Sendo interessante na estrategia de gerar e testar.


% Defina um predicado natural(?N) que e verdadeiro se N e um numero
% natural. Se N nao estiver instanciado, o predicado deve gerar numeros naturais.
natural(0).
natural(N) :-
    natural(M),
    N is M+1.

% Corte
% As vezes e necessario interromper o processo de retrocesso.
% Para isso utilizamos o corte.
% Corte e especificado com o predicado ! .
%
% Quando o Prolog encontra o operador de corte (!) durante a busca por soluções, ele “corta” todas as outras alternativas de regras que poderiam ser usadas e se compromete com a escolha atual.
%  - Isso significa que todas as outras opções que não foram exploradas até o ponto do corte são descartadas e não serão consideradas em futuras tentativas de encontrar soluções.

cliente(carla).
cliente(carol).

bar(X) :-
    cliente(X),
    !.

% Utilidades do corte.
%
% Confirmação de escolha: O operador de corte pode ser usado para confirmar uma escolha feita pelo programa. Uma vez que uma escolha é confirmada com um corte, o Prolog não tentará outras alternativas para essa regra se a consulta falhar mais tarde. Exemplo:
max(X,Y,X) :-
    X >= Y,
    !.
max(_, Y, Y).

% Aqui, se X >= Y for verdadeiro, o Prolog se compromete com a primeira regra e não tentará a segunda regra, mesmo que a consulta falhe mais tarde.

% Junto com o predicado fail: O operador de corte é frequentemente usado com o predicado fail para forçar o programa a falhar depois de realizar certas ações. Exemplo:
write_list([]) :- !.
write_list([H|T]) :-
    write(H),
    nl,
    fail,
    write(T).
write_list(_).


% Defina um predicado aprovado(A) que e verdadeiro se o aluno A foi
% aprovado. Um aluno pode ser aprovado se ele obteve media maior ou
% igual a 6 ou se a apos o exame ele obteve media maior ou igual a
% 5. Em ambos os casos ele deve ter pelo menos 75% de presenca.

% aluno(Nome, Media, MediaFinal, Presenca)
aluno(joao, 7, _, 80).
aluno(maria, 5, 6, 80).
aluno(carlos, 5, 4, 80).
aluno(ana, 7, _, 70).

aprovado(A) :-
    aluno(A, Media, _, Presenca),
    Media >= 6,
    Presenca >= 75.

aprovado(A) :-
    aluno(A,_, MediaFinal, Presenca),
    MediaFinal >= 5,
    Presenca >= 75.

% O operador \+ pode ser implementado da seguinte forma
neg(P) :-
    call(P),
    !,
    fail.
neg(P).




% Defina um predicado primeiro primo(+N, ?P) que e verdadeiro se P e o
% primeiro primo maior que ou igual a N. Use a estrategia gerar e
% testar, gere numeros inteiros a partir de N e teste se ele e primo.
primo(2).
primo(N) :-
    N>2,
    \+((X),
       X is 2,
       N mod X =:= 0).

proximo(N, P) :-
    P is N+1.

primeiro_primo(N, P) :-
    primo(N),
    P is N,
    !.
primeiro_primo(N, P) :-
    proximo(N, Proximo),
    primeiro_primo(Proximo, P).

