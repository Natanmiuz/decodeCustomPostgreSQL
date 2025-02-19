CREATE OR REPLACE FUNCTION decode_custom(input_value anyelement, VARIADIC args anyarray) 
RETURNS anyelement AS $$
DECLARE
    i integer;
BEGIN
    -- Check if the number of arguments is even
    IF array_length(args, 1) % 2 != 0 THEN
        RAISE EXCEPTION 'El número de argumentos debe ser par';
    END IF;

    -- Iterate over the array of pairs
    FOR i IN 1..array_length(args, 1) / 2 LOOP
        -- Compare the input value with the comparison value
        IF input_value::text = args[(i - 1) * 2 + 1]::text THEN
            -- Return the corresponding value directly
            RETURN args[(i - 1) * 2 + 2];
        END IF;
    END LOOP;
    
    -- If no match was found, return input_value
    RETURN input_value;
END;
$$ LANGUAGE plpgsql;