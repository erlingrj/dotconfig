# Information about issues on Ubuntu

## Ubuntu 20.04

### Freezes randomly for long time
- Seems to be related to graphics card and drivers
- When Teams is running I see in syslog errors on GPU and thn warning from Mouse that it has lost a bunch of ecents
- In journalctl I see that mesa_glthread is overrden
- ncidia-detector => nvidia-driver-510 
- "software-properties-gtk" to select which drivers to use with GPU. I picked nvidia-driver-470 which says it is tested. It was default at X.ORg X Server
