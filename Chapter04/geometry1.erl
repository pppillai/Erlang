-module(geometry1).
-export([area/1, test/0]).


area({rectangle, Width, Height}) ->
    Width * Height; %clauses are separated by semi colon.
area({square, Side}) ->
    Side * Side;
area(_) ->
    "Only supported {rectangle, Width, Height} or {square, Side}".


test() ->
    ExpectedString = "Only supported {rectangle, Width, Height} or {square, Side}",
    600 = area({rectangle, 20, 30}),
    400 = area({square, 20}),
    ExpectedString = area({"hello world"}),
    "All Tests Passed".
