% ------------------------------------------------------------------------------
% fatorial(N, F)
% ------------------------------------------------------------------------------
% Esta função calcula o fatorial de um número 'N' dado e retorna o resultado em 'F'.
% Ela usa recursão para calcular o fatorial, onde o caso base é quando N = 0,
% neste caso, o fatorial é 1.
%
% Entrada:
% N - Um inteiro não negativo para o qual o fatorial deve ser calculado.
%
% Saída:
% F - O fatorial do número de entrada 'N'.
% ------------------------------------------------------------------------------

fatorial(0, 1).
fatorial(N, F) :-
    N > 0, % Verifica se n é maior do que 0.
    N1 is N-1, % N1 = Termo anterior a N, no caso, N-1.
    fatorial(N1, F1), % Chama a função fatorial recursivamente.
    F is N*F1. % F é o termo de entrada, multiplicado, pelo termo anterior.
