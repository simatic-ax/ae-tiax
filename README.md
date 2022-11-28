# Application Example for TIAX use case

## TIAX use case

The TIAX use case is a workflow, which converts a library written in ST and SIMATIC AX to TIA Portal global library for TIA Portal > V18


## What shows the application example:

This application example shows two different use cases:

1. Trafficlight
    
    The Trafficlight is a simple state machine, which shows the the phases of a traffic light (`red` --> `red-yellow` --> `green` --> `yellow` --> `red`). Each phase will be active for one second.

    ```mermaid
    stateDiagram-v2
        [*] --> red
        red --> redyellow : T#1s
        redyellow --> green : T#1s
        green --> yellow : T#1s
        yellow --> red : T#1s
        state : "red-yellow" AS redyellow
    ```

1. JsonSerializer

    The function block `JsonStructure` has as input parameter: `DeviceName : STRING`, `IP : STRING`, `Timeout : INT`, `AutoConnect : BOOL`. On the rising edge of the `Execute` signal the input parameters will be read and converted to into a Json structure.

    Example:

    ```json
    {"DeviceName": "Device1", "Parameter": {"IP": "192.168.0.1", "Timeout": 300, "AutoConnect": true}}
    ```

## Steps to create the TIA Portal Global Library

1. If not done yet: Login to AX with apax login

1. Install dependencies

    ```sh
    apax install
    ```

1. Create the TIA Portal Library

    ```sh
    apax create-tialib
    ```

    The Global Library will be stored in ./bin/TIAPortalLibrary

1. Create or open an existing TIA Portal project

1. Open the Global Library in TIA Portal

1. Call the Block `ParkingCounterWrapper` in your application

    ![TIA](img/TiaUsage.png)


## Used features in this application example

### ST features
- Namespaces
- Enumeration
- Class & Methods 
- Call of private methods (THIS-Operator)
- Definition and implementation of interfaces (INTERFACE/IMPLEMENTS)
- Access modifier (PRIVATE/PUBLIC)

### UnitTesting
- Test fixture
- Test method
- Assertions

### AX Code Features
- Snippets
