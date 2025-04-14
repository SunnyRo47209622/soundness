#!/bin/bash

# ===== 1. Pip Node Treple Tap =====
echo "Starting Pip Node Treple Tap..."

./pop \
  --ram 8 \                        # RAM in GB
  --max-disk 250 \                 # Max disk usage in GB
  --cache-dir /data \             # Cache location
  --pubKey EtbGHistSM3dE51ADCC45AHZvmXpTRizWwc5AQnsk9Jt   # Solana public key

echo "--------------------------------------"

# ===== 2. Dria Node Start =====
echo "Starting Dria Node..."

sudo dkn-compute-launcher start

echo "--------------------------------------"

# ===== 3. Kuzco Node Treple Tap =====
echo "Starting Kuzco Node..."

kuzco worker start --worker yfq33EJlORUt5MVURVkoY --code 216b6944-8647-4949-b5bc-98fdea7a45d3

echo "--------------------------------------"

# ===== 4. Gensyn Node =====
echo "Starting Gensyn Node..."

cd rl-swarm || exit

python3 -m venv .venv
source .venv/bin/activate

./run_rl_swarm.sh

echo "--------------------------------------"

# ===== 5. Bitz Node =====
echo "Starting Bitz Node..."

bitz collect --cores 5

echo "✅ All nodes initiated."
