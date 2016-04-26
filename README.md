# rssmx100a-epics-ioc

## Overall

Repository containing the EPICS IOC support for the R&S SMA100A and
SMB100A signal generators. Some functionalities haven't been
implemented due to been exclusive to SMA100A, although they can be
added through adding the specific records to the *.db* file.

## PV Structures

The PVs have 3 parameters: The device identifier, the functionality
group and the functionality name, all separated by colons as shown
below.

```
DEVICE_IDN:GROUP:NAME
```

The DEVICE_IDN is set on the *st.cmd* file, and can be easily
costumized. For the initialization of the IOC, the device IP must be
given, either by passing it as the argument *DEVICE_IP* during the
initialization or by setting it on the
*iocBoot/iocrssmx100a/device.config* file.

## Example

### Initialization

For the IOC on this repository, the initialization can be done through
the following commands starting at the top level directory:


```sh
$ make clean &&
$ make uninstall &&
$ make &&
$ cd iocBoot/iocrssmx100a &&
$ DEVICE_IP="10.0.18.34" DEVICE_INST="0" ../../bin/linux-x86_64/rssmx100a ./st.cmd
```

The *DEVICE_IP* and *DEVICE_INST* specify the instrument IP and the
instantiation tag, which will be present at the *DEVICE_IDN* and should
be unique to differenciate the device from similars.

In some situations is desired to run the process using the procServ,
which enables the IOC to be controlled by the system. This is done
through the following commands:

```sh
$ make clean &&
$ make uninstall &&
$ make &&
$ cd iocBoot/iocrssmx100a &&
$ procServ -n "RSSMX100A" -f -i ^C^D 20000 ./run.sh 10.0.18.34 0
```

It is important to notice that the *DEVICE_IP* and *DEVICE_INST*
arguments are passed after the */run.sh* in the last line.

### Caput

An example of writing frequency is given below:

```
$ caput DIG-RSSMX100A-0:GENERAL:Freq 1e8
```

### Caget

An example of reading frequency is given below:

```
$ caget DIG-RSSMX100A-0:GENERAL:Freq_RBV
```

## Implemented Functionalities

The functionalities are divided in 3 major groups: GENERAL, MOD and
FREQ. To set values, use the given name. To read them, add *_RBV*
after it.

- **GENERAL** - General functionalities
 - **Reset**: Reset the device to default state
 - **Idn**: Get the device identification
 - **Freq**: Set device frequency (Hz)
 - **Level**: Set device level (dBm)
 - **RFState**: Enable/Disable RF (OFF|ON)
 - **RFLevel**: Set RF Level (dBm)

- **MOD** - Funcitionalities related to MODulation
 - **AMState**: Enable/Disable AM (OFF|ON)
 - **AMSource**: Select AM source (INT|EXT)
 - **FMState**: Enable/Disable FM (OFF|ON)
 - **FMSource**: Select FM source (INT|INT,EXT|EXT|EDIG)
 - **PGState**: Enable/Disable pulse generation (OFF|ON)
 - **PMState**: Enable/Disable PM (OFF|ON)
 - **PMWidth**: Set PM width (rad)
 - **PMPol**: Select PM polarity (NORMz|INV)
 - **PMPeriod**: Set PM period (seconds)
 - **PMMode**: Select PM mode (SING|DOUB|PTR)
 - **AllState**: Enable/Disable all modulations (OFF|ON)

- **FREQ** - Functionalities related to FREQuency
 - **FreqMode**: Select frequency mode (CW|SWE|LIST)
 - **StartFreq**: Set start frequency (Hz)
 - **StopFreq**: Set stop frequency (Hz)
 - **StepFreq**: Set frequency step (Hz)
