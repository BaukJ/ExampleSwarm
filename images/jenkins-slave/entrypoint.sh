#!/usr/bin/env sh

# # # # # Load any container environmental variables
cat /proc/1/environ |tr '\0' '\n' | sed "s/^/export /g" > /tmp/env
source /tmp/env
rm /tmp/env

# # # # # Setup 
SECRETS_DIR=/run/secrets
SSH_USER=${SSH_USER:-user}
SSH_USER_ID=${SSH_USER_ID:-1000}
SSH_USER_EXTRA_DIRS=${SSH_USER_EXTRA_DIRS:-}
SSH_DIR=/home/$SSH_USER/.ssh

printf "Setting up the ssh container...\n"

# # # # # Get options : This does not work as this is now a service
if [[ "$1" == "help" ]]
then
    printf "
        SECRETS / ENVIRONMENT
       =======================
        - SSH_PUBLIC_KEY            # To set the ssh public key
        - SSH_PUBLIC_KEY_[A-Z0-9]*  # If you need to add more public keys
    "
    exit
fi

# # # # #  Load any variables given to container

# # # # # Get any docker secrets
if [[ -d "$SECRETS_DIR" ]]
then
    cd $SECRETS_DIR
    for secret in *
    do
        eval export $secret=\"$(cat $secret)\"
        rm $secret
    done
fi



# # # # # Add the ssh user
useradd --uid $SSH_USER_ID $SSH_USER -m
mkdir -p $SSH_DIR $SSH_USER_EXTRA_DIRS

# # # # # Add any public keys
if [[ "$SSH_PUBLIC_KEY" ]]
then
    echo "$SSH_PUBLIC_KEY" >> $SSH_DIR/authorized_keys
fi
for key in $(env | sed -n "s/^SSH_PUBLIC_KEY_[A-Z0-9]*=//p")
do
    echo "$key" >> $SSH_DIR/authorized_keys
done

# # # # # Permission fixes
chown -R $SSH_USER_ID /home/$SSH_USER $SSH_USER_EXTRA_DIRS
chmod -R 700 $SSH_DIR

# # # # # Login fix
if [[ -f /run/nologin ]]
then
    mv /run/nologin /run/nologin-bak
fi


ccccc env
