# Example library for TIAX use case

## Description

This sample library contains suitable functionalities for determining the parking space occupancy of a car park. 

![CarPark](images/CarPark.png)

## Software blocks

### Counter

Generic `Counter` class for counting upwards and downwards.

### ParkingCounter

Class `ParkingCounter` counts the filling level of the car park depending on the above described sensor signal sequence.

This class has two input sensors:
- BSensorInside
- BSensorOutside

Depending in which order the signals are occupied, the counter-value will be incremented or decremented.

Example for entering the car park:
First will the SensorOutside occupied and then SensorInside. In this case, the counter will be increased by one. 

### ParkingCounterFB

TIA Portal compatible `ParkingCounterFB` which acts as wrapper `function block`. It uses internally the class `ParkingCounter`

_Maybe a link what a wrapper FB is ?_ 
_How does a wrapper work? Also link to explanation_

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

    ![TIA](images/TiaUsage.png)


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
