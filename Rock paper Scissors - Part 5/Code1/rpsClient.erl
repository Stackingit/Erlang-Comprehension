-module(rpsClient).
-compile( export_all ).

attack( Attack ) ->
  gen_server:call( {rpsServer, server@SteveEEE }, {attack,Attack} ).
