CONFIG_PATH=/data/options.json

HOST=$(jq --raw-output ".public_key" $HOST)
PUBLIC_KEY=$(jq --raw-output ".public_key" $CONFIG_PATH)
PRIVATE_KEY=$(jq --raw-output ".private_key" $CONFIG_PATH)

mkdir -p "$HOME/.ssh"
echo $PUBLIC_KEY > .ssh/id_rsa.pub
echo $PRIVATE_KEY > .ssh/id_rsa

ssh -L 8123:homeassistant:8123 root@$HOST
