USING Simatic.Ax.Tiax;
USING AxUnit.Assert;
NAMESPACE Simatic.Ax.TrafficLight
    {TestFixture}
    CLASS TestStateGreen
        VAR PUBLIC
            state : StateGreen;            
            light : BOOL;
        END_VAR

        {Test}
        METHOD PUBLIC OnEntry_switch_on_green_light
            state.gn := REF(light);
            state.OnEntry();
            Equal(expected := TRUE, actual := light);
        END_METHOD

        {Test}
        METHOD PUBLIC OnEntry_counts_the_activations
            Equal(expected := 0, actual := state.GetActivations());
            THIS.OnEntry_switch_on_green_light();
            Equal(expected := 1, actual := state.GetActivations());
        END_METHOD

        {Test}
        METHOD PUBLIC Actions_counts_each_call
            Equal(expected := 0, actual := state.GetCalls());
            state.Action();
            Equal(expected := 1, actual := state.GetCalls());
            state.Action();
            Equal(expected := 2, actual := state.GetCalls());
        END_METHOD


        {Test}
        METHOD PUBLIC OnExit_switch_off_green_light
            // first switch on the light
            THIS.OnEntry_switch_on_green_light();
            // then Call the onExit method
            state.OnExit();
            Equal(expected := FALSE, actual := light);
        END_METHOD
        {Test}
        METHOD PUBLIC GetColor_returns_green
            Equal(expected := TRUE, actual := state.GetColor() = Colors#Green);
        END_METHOD

    END_CLASS    
END_NAMESPACE


