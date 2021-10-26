#!/bin/bash
set -e

# The install.sh script is the installation entrypoint for any features in this repository. 
#
# The tooling will parse the features.json + user devcontainer, and write 
# any build-time arguments into an .env file with the format
# _USERNAME_REPONAME_FEATUREID_OPTION=value
set -a
. ./features.env
set +a

GREETING=${_JOSHSPICER_DEVCONTAINER_FEATURES_TEMPLATE_HELLOWORLD_GREETING:-undefined}

tee /usr/hello.sh > /dev/null \
<< EOF
#!/bin/bash
RED='\033[0;91m'
NC='\033[0m' # No Color
echo -e "\${RED}${GREETING}, \$(whoami)!"
echo -e "\${NC}"
EOF

chmod +x /usr/hello.sh
sudo cat '/usr/hello.sh' > /usr/local/bin/hello
sudo chmod +x /usr/local/bin/hello