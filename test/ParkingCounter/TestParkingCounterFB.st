// USING Siemens.Ax.ExampleLibrary;
// USING AxUnit;

// NAMESPACE Siemens.Ax

//     {TestFixture}
//     CLASS TestParkingCounterFB
//         VAR
//             c : ParkingCounterWrapper;
//             bInside : BOOL;
//             bOutside : BOOL;
//         END_VAR
//         /// Sinal Sequence for 1 object entering
//         METHOD Enter_1_object_signal_sequence
            
//             bInside := FALSE;
//             bOutside := FALSE;
//             c(BSensorOutside := bOutside, BSensorInside := bInside, Limit := 2);
//             bInside := FALSE;
//             bOutside := TRUE;
//             c(BSensorOutside := bOutside, BSensorInside := bInside, Limit := 2);
//             bInside := TRUE;
//             bOutside := TRUE;
//             c(BSensorOutside := bOutside, BSensorInside := bInside, Limit := 2);
//             bInside := TRUE;
//             bOutside := FALSE;
//             c(BSensorOutside := bOutside, BSensorInside := bInside, Limit := 2);
//             bInside := FALSE;
//             bOutside := FALSE;
//             c(BSensorOutside := bOutside, BSensorInside := bInside, Limit := 2);
//         END_METHOD
//         /// Sinal Sequence for 1 object leaving
//         METHOD Leave_1_object_signal_sequence
//             bInside := FALSE;
//             bOutside := FALSE;
//             c(BSensorOutside := bOutside, BSensorInside := bInside, Limit := 2);
//             bInside := TRUE;
//             bOutside := FALSE;
//             c(BSensorOutside := bOutside, BSensorInside := bInside, Limit := 2);
//             bInside := TRUE;
//             bOutside := TRUE;
//             c(BSensorOutside := bOutside, BSensorInside := bInside, Limit := 2);
//             bInside := FALSE;
//             bOutside := TRUE;
//             c(BSensorOutside := bOutside, BSensorInside := bInside, Limit := 2);
//             bInside := FALSE;
//             bOutside := FALSE;
//             c(BSensorOutside := bOutside, BSensorInside := bInside, Limit := 2);
//         END_METHOD
//         {Test}
//         METHOD PUBLIC Count_1_object_entering
//             VAR_TEMP
//                 cv : DINT;
//             END_VAR
//             THIS.Enter_1_object_signal_sequence();
//             cv := c.countValue;
//             Assert.Equal(actual := cv, expected := 1);
//         END_METHOD
//         {Test}
//         METHOD PUBLIC CheckLimit_of_to_by_entering_three_objects
//             VAR_TEMP
//                 cv : DINT;
//             END_VAR
//             THIS.Enter_1_object_signal_sequence();
//             THIS.Enter_1_object_signal_sequence();
//             THIS.Enter_1_object_signal_sequence();
//             cv := c.countValue;
//             Assert.Equal(actual := cv, expected := 2);
//         END_METHOD
//         {Test}
//         METHOD PUBLIC Remove_one_of_one_object_and_expect_0
//             VAR_TEMP
//                 cv : DINT;
//             END_VAR
//             THIS.Enter_1_object_signal_sequence();
//             THIS.Leave_1_object_signal_sequence();
//             cv := c.countValue;
//             Assert.Equal(actual := cv, expected := 0);
//         END_METHOD
//     END_CLASS

// END_NAMESPACE
