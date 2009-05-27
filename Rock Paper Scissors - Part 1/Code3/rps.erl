-module(rps).
-export( [ attack/1 ] ).

attack( Attack ) ->
    case lists:member( Attack, validAttacks() ) of
        false ->
            {reply,stop_cheating};
        true ->
            ok
    end.

validAttacks()->
    [rock,paper,scissors].
    