-module(shop1).
-export([total/1]).

%[{orange, 10}, {pear, 5}, {newspaper, 1}, {milk, 10}]

total([{What, NumberOfItems} | T]) ->
    shop:cost(What) * NumberOfItems + total(T);

total([]) ->
    0.

