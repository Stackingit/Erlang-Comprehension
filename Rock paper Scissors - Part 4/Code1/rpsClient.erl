-module(rpsClient).
-compile( export_all ).

attack( Attack ) ->
  {rpsServer, server@SteveEEE } ! { self(), Attack },
  receive
    { result, Result, Detail }->
      io:format("~p : ~p",[ Result, Detail ] );
     Error ->
        Error
  end.
  
  