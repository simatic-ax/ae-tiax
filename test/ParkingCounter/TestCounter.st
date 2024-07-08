USING Siemens.Ax.ExampleLibrary;
USING AxUnit;

NAMESPACE Siemens.Ax

    {TestFixture}
    CLASS TestCounter
        VAR
            c : Counter;
            cStateless : Counter;
        END_VAR

        // This method will be called before each test method
        {TestSetup}
        METHOD PUBLIC MyTestSetup
            c := cStateless;
        END_METHOD
        {Test}
        METHOD PUBLIC Test_CountUp_1_Time_And_Get_1
            c.CountUp();
            Assert.Equal(actual := c.GetValue(), expected := 1);
        END_METHOD
        {Test}
        METHOD PUBLIC Test_CountDown_1_Time_And_Get_Minus_1
            c.CountDown();
            Assert.Equal(actual := c.GetValue(), expected := -1);
        END_METHOD
        {Test}
        METHOD PUBLIC Test_CountUp_3_Times_And_Get_3
            c.CountUp();
            c.CountUp();
            c.CountUp();
            Assert.Equal(actual := c.GetValue(), expected := 3);
        END_METHOD
        {Test}
        METHOD PUBLIC Test_CountDown_3_Time_And_Get_Minus_3
            c.CountDown();
            c.CountDown();
            c.CountDown();
            Assert.Equal(actual := c.GetValue(), expected := -3);
        END_METHOD
        {Test}
        METHOD PUBLIC Test_SetValue_To_5_And_Get_5
            c.SetValue(5);
            Assert.Equal(actual := c.GetValue(), expected := 5);
        END_METHOD
        {Test}
        METHOD PUBLIC Test_SetValue_wit_DefaultValue_And_Get_0
            c.SetValue(5);
            c.SetValue();
            Assert.Equal(actual := c.GetValue(), expected := 0);
        END_METHOD
    END_CLASS

END_NAMESPACE
