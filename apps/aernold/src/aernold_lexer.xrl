Definitions.

DIGIT      = [0-9]
LOWER      = [a-z_]
UPPER      = [A-Z]
WHITESPACE = [\s\t\n\r]
ID         = {LOWER}[a-zA-Z0-9_]*
TYPE       = {UPPER}[a-zA-Z0-9]*
INT        = {DIGIT}+
DECL       = {ID}[:]{TYPE}
OP         = [+\-=!<>:]

Rules.

Contract   : {token, {contract, TokenLine}}.
if         : {token, {'if', TokenLine}}.
else       : {token, {else, TokenLine}}.

; : {token, {';', TokenLine}}.
{ : {token, {'{', TokenLine}}.
} : {token, {'{', TokenLine}}.
\( : {token, {'(', TokenLine}}.
\) : {token, {')', TokenLine}}.
, : {token, {'{', TokenLine}}.

{OP}+        : {token, {list_to_atom(TokenChars), TokenLine}}.
{INT}        : {token, {int, TokenLine, list_to_integer(TokenChars)}}.
{ID}         : {token, {id, TokenLine, TokenChars}}.
{TYPE}       : {token, {type, TokenLine, TokenChars}}.
{DECL}       : {token, {decl, TokenLine, string:tokens(TokenChars, ":")}}.

{WHITESPACE} : skip_token.

Erlang code.