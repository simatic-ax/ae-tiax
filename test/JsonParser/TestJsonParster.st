USING Simatic.Ax.Conversion;
USING Simatic.Ax.Json;
USING AxUnit.Assert;
USING System.Strings;

NAMESPACE Simatic.Ax.Tiax

    {TestFixture}
    CLASS TestJsonParserWrapper
        VAR
            JsonParserWrapper : JsonParser;
        END_VAR

        {Test}
        METHOD PUBLIC MyTestMethod
            JsonParserWrapper.JsonAsString := '{"Name": "SIMATIC", "data": {"plc_type": 1518, "OPC_SERVER_ENABLED": 1}}';
            JsonParserWrapper(execute := TRUE);
            ; // AxUnit.Assert.Equal(y, x)
            Equal(expected := 'SIMATIC', actual := JsonParserWrapper.Name);
            Equal(expected := 1518, actual := JsonParserWrapper.Plc_type);
            Equal(expected := TRUE, actual := JsonParserWrapper.Opc_server_enabled);
        END_METHOD
    END_CLASS

END_NAMESPACE
