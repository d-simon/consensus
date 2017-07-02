# Genesis
geth init /app/genesis.json --datadir /data/ethData


if [ -f "~/.ethash/full-R23-000000000000000" ]; then
else
  wget https://0xfff.io/dag/full-R23-0000000000000000 && mv full-R23-0000000000000000 ~/.ethash
fi

# Each worker needs a local account to store ETH.   Make sure you use /data so that when the container is rebuilt/redeployed, you won't lose your data
echo "ethpasswd" > /data/ethpassword
geth --datadir /data/ethData --password /data/ethpassword account new

# Run and start mining
geth --networkid="115101110115" --rpc --datadir /data/ethData --mine
