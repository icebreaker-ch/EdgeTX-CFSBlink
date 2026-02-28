# EdgeTX-CFSBlink
A lua script class (library) to control the Customer Function Switch (CFS) Color LEDS on [EdgeTX](https://github.com/EdgeTX/edgetx) Radios, like the Radiomaster TX15 MAX.
##Features
The following parameters can be configured:
- Color for off state (default BLACK)
- COlor for off state when blinking (default BLACK)
- Color for on state when blinking (default WHITE)
- off-time when blinking (default 500 ms)
- on-time when blinking (defult 500 ms)
## Installation
- Copy the CFSBlink folder into your SD-Card SCRIPTS folder.
- Rename and edit the file `template.lua` on your requests (e.g. `myblink.lua`) and copy the file into the FUNCTIONS FOlder
- The structure on your radios SD-Card should look like this now:
```
:
/SCREENSHOTS
/SCRIPTS
    /CFSBLINK
        cfsblink.lua
    /FUNCTIONS
        myblink.lua
:
```
## Configuration
- Allow Lua override for the Customizable Switch you want to control:
 <img width="1015" height="177" alt="cfsconfig" src="https://github.com/user-attachments/assets/c1ce2e1f-0438-479f-87b6-8eb8829d8fdc" />

