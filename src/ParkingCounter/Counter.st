NAMESPACE Siemens.Ax.ExampleLibrary

    CLASS Counter
        IMPLEMENTS ICounter
        VAR
            _countValue : DINT;
        END_VAR
        METHOD PUBLIC CountUp
            _countValue := _countValue + DINT#1;
        END_METHOD
        METHOD PUBLIC CountDown
            _countValue := _countValue - DINT#1;
        END_METHOD
        METHOD PUBLIC SetValue
            VAR_INPUT
                value : DINT;
            END_VAR
            _countValue := value;
        END_METHOD
        METHOD PUBLIC GetValue : DINT
            GetValue := _countValue;
        END_METHOD
    END_CLASS

END_NAMESPACE
