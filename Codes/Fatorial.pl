fatorial(0, 1).
fatorial(N, F) :-
    N > 0, % Verifica se n � maior do que 0.
    N1 is N-1, % N1 = Termo anterior a N, no caso, N-1.
    fatorial(N1, F1), % Chama a fun��o fatorial recursivamente.
    F is N*F1. % F � o termo de entrada, multiplicado, pelo termo anterior.
