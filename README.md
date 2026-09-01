# Airgeddon (Custom Modified Version)

This repository contains a modified version of **[Airgeddon](https://github.com/v1s1t0r1sh3r3/airgeddon)**, a multi-use bash script for auditing wireless networks. 

## Notice of Modifications
This project is a derivative work based on Airgeddon, originally created and copyrighted by *v1s1t0r1sh3r3*. 

* *Modified File:* airgeddon.sh
* *Description of Changes:* Added a clean shutdown and recovery sequence to the exit routine. This sequence safely kills lingering background processes, stops monitor mode, restarts system networking services (NetworkManager and networking), and brings the physical wireless interface (wlan0) back up to prevent system crashes and lost Wi-Fi states upon exiting.
* *Original Project:* [Airgeddon Official GitHub Repository](https://github.com/v1s1t0r1sh3r3/airgeddon)

## License
This project is licensed under the *GNU General Public License v3.0 (GPLv3)* — see the [LICENSE](LICENSE) file for details. This ensures that this derivative work remains open-source and free under the exact same terms as the original software.

---
Original author copyright and notices have been preserved in accordance with GPLv3 requirements.
