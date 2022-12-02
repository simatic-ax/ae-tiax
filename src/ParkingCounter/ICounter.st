NAMESPACE Siemens.Ax.ExampleLibrary

    INTERFACE ICounter
        METHOD CountUp
        END_METHOD
        METHOD CountDown
        END_METHOD
        METHOD SetValue
            VAR_INPUT
                value : DINT;
            END_VAR
        END_METHOD
        METHOD GetValue : DINT
        END_METHOD
    END_INTERFACE

END_NAMESPACE
