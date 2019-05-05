-module(geometry).
-export([area/1]).


area({rectangle, Width, Height}) ->
    Width * Height; %clauses are separated by semi colon.
area({square, Side}) ->
    Side * Side;
area(_) ->
    "Only supported {rectangle, Width, Height} or {square, Side}".

