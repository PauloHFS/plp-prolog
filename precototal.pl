/*
Crie um programa que calcule o preço de uma compra em um e-commerce. 
O programa deve calcular o valor total da compra com o frete incluso. 
Para compras a partir de R$100, o cliente recebe frete grátis. 
Para compras com valores menores que R$100, o frete custará R$3 para cada item sendo comprado.
Os valores de entrada são a quantidade de tipos diferentes de produtos no carrinho e 
para cada produto seu preço e a quantidade no carrinho.
A saída é o preço da compra com duas casas decimais. 
Para isso, use a regra format('R$~2f', Resposta).
*/

loop(0, TotalProdutos, Total):-
    (Total >= 100 -> X is Total; X is 3 * TotalProdutos + Total),
    format("R$~2f", X), 
    nl,
    halt.

loop(N, TotalProdutos, Total):-
    read(Preco),
    read(Quantidade),
    NewTotal is Preco * Quantidade + Total,
    NewTotalProdutos is TotalProdutos + Quantidade,
    I is N - 1,
    loop(I, NewTotalProdutos, NewTotal).

main:-
    read(N),
    loop(N, 0, 0).