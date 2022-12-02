NAMESPACE Siemens.Ax.ExampleLibrary

    CLASS ParkingCounter
        VAR PUBLIC
            BSensorOutside : REF_TO BOOL;
            BSensorInside : REF_TO BOOL;
            Limit : INT;
        END_VAR
        VAR
            c : Counter;
            _bSensorOutsideOld : BOOL;
            _bSSensorInsideOld : BOOL;
        END_VAR
        /// Evaluate the signals of the entry barrier
        METHOD PUBLIC Execute
            THIS.Count(THIS.CheckDirection(sIn := BSensorInside^, sOut := BSensorOutside^));
        END_METHOD
        /// Returns the actual value of the ParkingCounter
        METHOD PUBLIC GetAmountOfParkedItems : DINT
            GetAmountOfParkedItems := c.GetValue();
        END_METHOD
        /// Count the counter upwards or downwards depending on the direction
        METHOD PROTECTED Count
            VAR_INPUT
                dir : Direction;
            END_VAR
            CASE dir OF
                Direction#Enter:
                    c.CountUp();
                    IF (c.GetValue() > Limit) THEN
                        c.SetValue(Limit);
                    END_IF;
                Direction#Leave:
                    c.CountDown();
                    IF (c.GetValue() < 0) THEN
                        c.SetValue();
                    END_IF;
            END_CASE;
        END_METHOD
        /// Checks Direction depending on the input signals
        METHOD PROTECTED CheckDirection : Direction
            VAR_INPUT
                sIn : BOOL;
                sOut : BOOL;
            END_VAR
            VAR_TEMP
                _bSensorOutsideRis : BOOL;
                _bSSensorInsideRis : BOOL;
            END_VAR
            _bSensorOutsideRis := BSensorOutside^ AND NOT (_bSensorOutsideOld);
            _bSensorOutsideOld := BSensorOutside^;
            _bSSensorInsideRis := BSensorInside^ AND NOT (_bSSensorInsideOld);
            _bSSensorInsideOld := BSensorInside^;
            IF (sIn AND _bSensorOutsideRis) THEN
                CheckDirection := Direction#Leave;
            ELSIF (sOut AND _bSSensorInsideRis) THEN
                CheckDirection := Direction#Enter;
            ELSE
                CheckDirection := Direction#Implausible;
            END_IF;
        END_METHOD
    END_CLASS

    TYPE
        Direction : (Enter, Leave, Implausible) := Implausible;
    END_TYPE

END_NAMESPACE
