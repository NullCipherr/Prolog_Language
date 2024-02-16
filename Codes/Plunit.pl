:-use_module(library(plunit)).

%% Tamanho(?XS,?T) is semidet
%
% Verdadeiro se o tamanho de XS é igual a T.

:-begin_tests(tamanho). % Inicia os testes.

% Teste para T==0.
test(t0) :-
    tamanho([],0).

% Teste para T==1.
test(t1) :-
    tamanho([4],1).

% Teste para T==2.
test(t2,T==2) :-
    tamanho([7,2], T).

:-end_tests(tamanho). % Fim dos testes.

tamanho([],0).
tamanho([_|XS],T) :-
    tamanho(XS, T0),
    T is T0+1.

