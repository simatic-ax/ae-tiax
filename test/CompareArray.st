NAMESPACE Simatic.Ax.Helper
    FUNCTION CompareArray : BOOL
        VAR_INPUT
            first : ARRAY[*] OF CHAR;
            scnd : ARRAY[*] OF CHAR;
            count : INT; 
        END_VAR    
        VAR_TEMP
            i : DINT;
            sFirst : DINT;
            sScnd : DINT;
            eFirst : DINT;
            eScnd : DINT;
            res : BOOL;
            _count : DINT;
        END_VAR

        sFirst := LOWER_BOUND(first, 1);
        sScnd := LOWER_BOUND(scnd, 1);
        eFirst := UPPER_BOUND(first, 1);
        eScnd := UPPER_BOUND(scnd, 1);

        _count := count;

        IF ((eFirst - sFirst + 1) < count) THEN
            CompareArray := FALSE;
            RETURN;
        END_IF;
        IF ((eScnd - sScnd + 1) < count) THEN
            CompareArray := FALSE;
            RETURN;
        END_IF;

        IF _count > (eFirst - sFirst + 1) THEN
            _count := eFirst - sFirst + 1;
        END_IF;

        FOR i := 0 TO _count - 1 DO
            res := first[i + sFirst] = scnd[i + sScnd];
            IF (res = FALSE) THEN
                CompareArray := FALSE;
                RETURN;
            END_IF;
        END_FOR;
        CompareArray := TRUE;
    END_FUNCTION
END_NAMESPACE