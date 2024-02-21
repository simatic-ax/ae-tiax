NAMESPACE Siemens.Ax.ExampleLibrary

    FUNCTION_BLOCK ParkingCounterWrapper
        VAR_INPUT
            BSensorOutside : BOOL;
            BSensorInside : BOOL;
            Limit : INT;
        END_VAR
        VAR_OUTPUT
            countValue : DINT;
        END_VAR
        VAR
            c : ParkingCounter;
            init : BOOL;
        END_VAR
        IF NOT (init) THEN
            c.BSensorOutside := REF(BSensorOutside);
            c.BSensorInside := REF(BSensorInside);
            c.Limit := Limit;
            init := TRUE;
        END_IF;
        c.Execute();
        countValue := c.GetAmountOfParkedItems ();
    END_FUNCTION_BLOCK

END_NAMESPACE
