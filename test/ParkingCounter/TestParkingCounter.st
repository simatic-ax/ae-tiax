USING Siemens.Ax.ExampleLibrary;
USING AxUnit;

NAMESPACE Siemens.Ax

    {TestFixture}
    CLASS TestParkingCounter
        VAR
            c : ParkingCounter;
            cStateless : ParkingCounter;
            bInside : BOOL;
            bOutside : BOOL;
        END_VAR
        // This method will be called before each test method
        {TestSetup}
        METHOD PUBLIC MyTestSetup
            c := cStateless;
        END_METHOD
        METHOD Config
            c.BSensorInside := REF(bInside);
            c.BSensorOutside := REF(bOutside);
            c.Limit := 2;
        END_METHOD
        /// Sinal Sequence for 1 object entering
        METHOD Enter_1_object_signal_sequence
            THIS.Config();
            bInside := FALSE;
            bOutside := FALSE;
            c.Execute();
            bInside := FALSE;
            bOutside := TRUE;
            c.Execute();
            bInside := TRUE;
            bOutside := TRUE;
            c.Execute();
            bInside := TRUE;
            bOutside := FALSE;
            c.Execute();
            bInside := FALSE;
            bOutside := FALSE;
            c.Execute();
        END_METHOD
        /// Sinal Sequence for 1 object leaving
        METHOD Leave_1_object_signal_sequence
            THIS.Config();
            bInside := FALSE;
            bOutside := FALSE;
            c.Execute();
            bInside := TRUE;
            bOutside := FALSE;
            c.Execute();
            bInside := TRUE;
            bOutside := TRUE;
            c.Execute();
            bInside := FALSE;
            bOutside := TRUE;
            c.Execute();
            bInside := FALSE;
            bOutside := FALSE;
            c.Execute();
        END_METHOD
        {Test}
        METHOD PUBLIC Count_1_object_entering
            THIS.Enter_1_object_signal_sequence();
            Assert.Equal(actual := c.GetAmountOfParkedItems (), expected := 1);
        END_METHOD
        {Test}
        METHOD PUBLIC CheckLimit_of_to_by_entering_three_objects
            THIS.Enter_1_object_signal_sequence();
            THIS.Enter_1_object_signal_sequence();
            THIS.Enter_1_object_signal_sequence();
            Assert.Equal(actual := c.GetAmountOfParkedItems (), expected := 2);
        END_METHOD
        {Test}
        METHOD PUBLIC Remove_one_of_one_object_and_expect_0
            THIS.Enter_1_object_signal_sequence();
            THIS.Leave_1_object_signal_sequence();
            Assert.Equal(actual := c.GetAmountOfParkedItems (), expected := 0);
        END_METHOD
    END_CLASS

END_NAMESPACE
