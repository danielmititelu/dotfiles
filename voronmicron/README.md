# Voron Micron

Klipper config for a Formbot Micron 180 kit.

## Parts

- Mainboard: BTT Manta M8P V2.0 with a CB1
- Toolhead board: BTT EBB36 CAN V1.2
- Toolhead: Dragon Burner
- Extruder: Sherpa Mini, round NEMA14 stepper with a 10T gear
- Hotend: E3D Revo Voron
- Probe: Klicky
- A/B motors: NEMA14
- Z motors: 4 x NEMA17
- Stepper drivers: TMC2209
- Fans: one hotend 2510 axial fan, two part cooling 4010 Blower Fan
- Web interface: Mainsail

## Useful commands

Type these in the Mainsail console.

### Restarting

- `RESTART`: reload the config
- `FIRMWARE_RESTART`: reload the config and reset the boards; needed after a shutdown error
- `SAVE_CONFIG`: write calibration results into `printer.cfg` and restart

### Homing and moving

- `G28`: home all axes; the first homing after a restart lifts the gantry about 30 mm
- `G28 X Y`: home X and Y only
- `G28 Z`: home Z only; run it after `QUAD_GANTRY_LEVEL`
- `G1 X90 Y90 F1200`: move to a position; `F` is the speed in mm/min
- `G1 Z20 F300`: move the nozzle to 20 mm above the bed
- `G91` / `G90`: switch to relative / absolute moves
- `M84`: release the motors; all axes need homing again

### Moving Z before it is homed

- `SET_KINEMATIC_POSITION Z=100`: pretend the gantry is at Z100 so it can be moved
- `G91`, `G1 Z-10 F300`, `G90`: lower the gantry 10 mm (positive Z raises it)
- `M84`: clear the pretend position; always run this afterwards

### Motors

- `STEPPER_BUZZ STEPPER=stepper_z`: move one motor 1 mm up and down ten times, to check its corner and direction

Z motor names:

- `stepper_z`: front left
- `stepper_z1`: rear left
- `stepper_z2`: rear right
- `stepper_z3`: front right

### Klicky probe

- `QUERY_PROBE`: show the probe state; `TRIGGERED` in the dock or pressed, `open` on the toolhead
- `Attach_Probe`: pick the probe up from the dock
- `Dock_Probe`: put the probe back in the dock

### Levelling and Z offset

- `QUAD_GANTRY_LEVEL`: square the gantry to the bed with the four Z motors
- `QUAD_GANTRY_LEVEL HORIZONTAL_MOVE_Z=15`: same, with more clearance for a badly tilted gantry
- `PROBE_CALIBRATE`: start the Z offset calibration (paper test)
