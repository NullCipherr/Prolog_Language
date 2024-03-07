% Entrada e Saída
%

% Alguns átomos devem estar entre aspas simples porque eles começam com
% uma letra maiúscula, e não são variáveis:
evento(1505, ['Euclid',translated, into, 'Latin']).
evento(1510, ['Reuchlin-Pfefferkorn', controversy]).
evento(1523, ['Christian', 'II', flees, from, 'Denmark']).

% Fatos da história como listas de átomos dá a vantagem de que
% "pesquisas" podem ser feitas para encontrar uma data em que certos
% acontecimentos ocorreram.

quando(X,Y) :-
    evento(Y, Z),
    member(X, Z).

% Reading and Writing Terms
%
% Escreve os eventos que aconteceram no ano X
ask_date(Evento) :-
    read(X),
    evento(X, Evento).

% Escrevendo Termos
%
% A forma mais util de exibir um termo na tela do computador e utilizar
% o predicado write.


% Não é uma boa idéia usar write para escrever o evento do exemplo, pois
% ele o irá escrever no formato padrão de listas do Prolog, com
% colchetes e vírgulas.
% Contudo, se usar o write para exibir os componentes individuais da
% lista, então se poderá conseguir algo mais legível.

% Pretty-print
% Para acompanhar a "profundidade" do elemento que está sendo exibido,
% deve-se exibir um certo número de espaços antes dele:
spaces(0):- !.
spaces(N):- write(' '), N1 is N-1, spaces(N1).

% Imprime começo da lista e controla identação
pp([H|T ], I):- !,
J is I + 3,
pp(H, J),
ppx(T, J). %elemento
pp(X, I):- spaces(I), write(X), nl.

% Imprimir restante da lista (sem identar)
ppx([],_).
ppx([H|T], I):- pp(H, I), ppx(T, I).

% Write Canonical
%
% write_canonical trata os operadores + e * como outros átomos.
% Usar write_canonical pode ser útil para verificar a precedência dos
% operadores.

% +(a, *(*(b,c),c))
%

% testa pares de caracteres errôneos em inglês
check_line(OK) :-
    get_char(X),
    rest_line('\n', X, OK).


% Lendo e Escrevendo Arquivos
%
% Antes de acessar um arquivo, é necessário abrir um stream associado a
% ele (em modo leitura ou escrita):
% open(’myfile.pl’, read, X).
% open(‘output.txt’, write, X).
%
% Ler em um arquivo
%
% open('myfile.pl', read, X),
% code_reading_from(X),
% close(X).
%
% Onde code_reading_from(X) é o predicado que para ser satisfeito
% precisará do stream X.

% Escrever em um arquivo
%
% open('output', write, X),
% code_writing_to(X),
% close(X).
%
%  - Onde code_writing_to(X) é o predicado que irá escrever dados no
%  stream de saída.
