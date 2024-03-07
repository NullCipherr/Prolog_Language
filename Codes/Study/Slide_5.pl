% Adicionando Novos fatos a base de conhecimento.
%
%  O predicado assert e utilizado em Prolog quando desejamos adicionar
%  novas sentencas a base de conhecimento.
assert(homem(joao)).
assert(filho(Y,X) :- progenitor(X,Y)).


% Removendo Fatos da Base de Conhecimento
%
%  Ao utilizar o predicado retract e retractall, estamos removendo fatos
%  e regras.
%  Similar ao assert.
retract(homem(joao)).
retract(filho(Y,X) :- progenitor(X,Y)).
