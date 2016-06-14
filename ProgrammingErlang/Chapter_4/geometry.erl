-module(geometry).

%% API
-export([area/1, perimeter/1]).

area({rectangle, Width, Height}) -> Width * Height;
area({square, Side}) -> Side * Side;
area({circle, Radius}) -> math:pi() * Radius * Radius;
area({triangle_rect, Width, Height}) -> (Width * Height) / 2.

perimeter({rectangle, Width, Height}) -> (Width + Height) * 2;
perimeter({square, Side}) -> Side * 4;
perimeter({circle, Radius}) -> 2 * math:pi() * Radius;
perimeter({triangle_rect, Width, Height}) -> Width + Height + math:sqrt(math:pow(Width, 2) + math:pow(Width, 2)).