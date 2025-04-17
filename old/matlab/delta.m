function delta = delta(N)
%N é o número de amostras;
delta = 1.*(N==0);
%a multiplicação por um valor escalar transforma a variável lógica em uma
%variável numérica
return