# rssmx100a-epics-ioc

## Overall

Repository containing the EPICS IOC support for the R&S SMA100A and
SMB100A signal generators. Some functionalities are exclusive to SMA100A.

## Example

### Initialization

For the IOC on this repository, the initialization can be done through
the following commands starting at the top level directory:


```sh
$ make clean &&
$ make uninstall &&
$ make &&
$ cd iocBoot/iocrssmx100a &&
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
$ procServ -n "RSSMX100A" -f -i ^C^D 20000 ./run.sh 10.0.18.43 0
```

It is important to notice that the *DEVICE_IP* and *DEVICE_INST*
arguments are passed after the */run.sh* in the last line.

### Caput

An example of writing frequency is given below:

```
$ caput ${P}${R}:GENFreq-SP 1e8
```

### Caget

An example of reading frequency is given below:

```
$ caget ${P}${R}:GENFreq-RB
```

## RSSMX100A PV Structure

The PV's are divided in 7 major groups: GENERAL, FREQ, MOD,
TRIG, ROSC, CSYN and NOIS. To set values, use the given name. To read
them, add *_RBV* after it.

- **GENERAL** - General functionalities

- **FREQ** - Functionalities related to FREQuency

- **MOD** - Functionalities related to MODulation

- **TRIG** - Functionalities related to TRIGgering

- **ROSC** - Functionalities related to Reference OSCillator

- **CSYN** - Functionalities related to Clock SYNthesis

- **NOIS** - Functionalities related to NOISe

The suffixes indicate the PV type and can be one of the following:

- SP (Set Point): A non-enumerated value (real number or string). It sets a system parameter.
- RB (Read Back): A non-enumerated value (real number or string). Read-only. It displays the read back value of a parameter, providing confirmation to changes.
- Sel (Selection): Enumerated value. Sets a system parameter.
- Sts (Status): Enumerated value. Read-only. It displays the read back value of an enumerated parameter, providing confirmation to changes.
- Cmd (Command): Binary command. It causes a given action to be executed.
- Mon (Monitor): Monitor non-enumerated or enumerated  device property variable

## Running the OPIs

The *OPI/CSS* directory provide OPIs for easily controlling the multimeter and applications process variables. In order to run the operator interfaces it is necessary to have Control System Studio installed. It is recommended to run `cs-studio` in the OPI folder, in order to avoid having to reconfigure CS-Studio preferences.
