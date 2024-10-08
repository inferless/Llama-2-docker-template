#!/bin/bash
# Start the TGI server
text-generation-launcher --model-id $MODEL_ID --port $PORT --num-shard $NUM_SHARD --max-input-length $MAX_INPUT_LENGTH --max-total-tokens $MAX_TOTAL_TOKENS &

# Start the Flask app
uvicorn app:app --host 0.0.0.0 --port 7000 --reload
