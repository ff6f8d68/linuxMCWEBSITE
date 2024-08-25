if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	wget https://linuxmc.vercel.app/pool/linuxMC.sh
	mkdir library
	cd library
	wget https://linuxmc.vercel.app/linuxMC/library/setupLIB.setup
        sudo bash setupLIB.setup linux
else
	#!/bin/bash
	curl -LJO https://linuxmc.vercel.app/linuxMC/linuxMC.sh
	mkdir library
	cd library
	curl -LJO https://linuxmc.vercel.app/linuxMC/library/setupLIB.setup
	bash setupLIB.setup other
fi
