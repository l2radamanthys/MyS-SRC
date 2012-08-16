PROGRAM PerforacionPozoA; {Simulacion de la Perforacion del Pozo A}

USES crt;

CONST
    PROFUNDIDAD = 180; { longitud del pozo en unidades de longitud }
    PERFORACION_D = 7;   { longitud perforada por jornada en unidades de longitud }
    LLEGA_MAQ_N = 0.71;   {Probabilidad de llegada de una Maquina Nueva antes de empezar a perforar }
    AVERIA_MAQ_V = 0.28;  { Probabilidad de que se averie la maquina Vieja }
    AVERIA_MAQ_N = 0.14;  { Probabilidad de que se averie la maquina Nueva }
    AVERIA_GRAVE = 0.35; {Probabilidad de que ya que sucedio una averia esta sea grave}
    T_REPARACION_G = 4;
    T_REPARACION_L = 1;

VAR

   prof_perforada: Integer;
   n_jornadas: Integer;
   n_averias, n_averias_g, n_averias_l: Integer;
   rand: Real;
   maq_n: Boolean;

BEGIN
    writeln('-- Inicio de la Simulacion de Perforacion Pozo A --');
    prof_perforada := 0;

    randomize;
    rand := random; { para preguntar si llego la maquinaria nueva }
    if rand < LLEGA_MAQ_N then
        begin
        writeln('¿Llego Maquinaria Nueva?: Si');
        maq_n := TRUE;
        end
    else
        begin
        writeln('¿Llego Maquinaria Nueva?: No');
        maq_n := FALSE;
        end;
    writeln('-- Comienzo Perforacion --');
    if maq_n = TRUE then {si se usa maquina nueva }
        begin
        writeln('Se Usara la Maquina Nueva');
        while prof_perforada < PROFUNDIDAD do
            begin
                rand := random; { ¿ocurre una averia? }
                if rand < AVERIA_MAQ_N then
                    begin
                    n_averias := n_averias + 1;
                    rand := random; { ¿la averia es grave? }
                    if rand < AVERIA_GRAVE then
                        begin
                            n_averias_g := n_averias_g + 1;
                            writeln('Sucedio una averia Grave :_(');
                        end
                    else
                        begin
                            writeln('Sucedio una averia leve :(');
                        end
                    end
                else
                    begin
                        prof_perforada := prof_perforada + PERFORACION_D;
                        n_jornadas := n_jornadas + 1;
                        writeln('Profundidad Perforada Actualmente:', prof_perforada);
                    end
            end
        end
    else
        begin
        writeln('Se Usara la Maquina Vieja');
        while prof_perforada < PROFUNDIDAD do
            begin
                rand := random; { ¿ocurre una averia? }
                if rand < AVERIA_MAQ_V then
                    begin
                    n_averias := n_averias + 1;
                    rand := random; { ¿la averia es grave? }
                    if rand < AVERIA_GRAVE then
                        begin
                            n_averias_g := n_averias_g + 1;
                            writeln('Sucedio una averia Grave :_(');
                        end
                    else
                        begin
                            writeln('Sucedio una averia leve :(');
                        end
                    end
                else
                    begin
                        prof_perforada := prof_perforada + PERFORACION_D;
                        n_jornadas := n_jornadas + 1;
                        writeln('Profundidad Perforada Actualmente:', prof_perforada);
                    end
            end
        end;
    { Datos Finales }
    writeln;
    n_averias_l := n_averias - n_averias_g;
    { calculo del nro total de Jornadas nec para perforar el poso}
    n_jornadas := n_jornadas + (n_averias_g * T_REPARACION_G) + (n_averias_l * T_REPARACION_L);
    writeln('Numero de Jornadas Necesarias Para Perforar el pozo: ', n_jornadas);
    writeln('Llego la Maquina Nueva: ', maq_n);
    writeln('Numero de Averias: ', n_averias);
    writeln('Numero de Averias Graves: ', n_averias_g);
    writeln('Numero de Averias Leves: ', n_averias_l);
END.
