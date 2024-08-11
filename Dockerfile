# Use the official TGI image as the base image
FROM ghcr.io/huggingface/text-generation-inference:latest


# Copy the application code and start the script
COPY app.py /app/app.py
COPY start.sh /app/start.sh

# Set the working directory
WORKDIR /app
RUN pip3 install fastapi==0.101.0 text-generation==0.7.0 pydantic==2.1.1 pydantic_core==2.4.0 urllib3==2.0.4uvicorn==0.23.2

# Make the start script executable
RUN chmod +x /app/start.sh

# Set environment variables
ENV MODEL_ID="meta-llama/Llama-2-7b-chat-hf"

# Expose the port the app runs on
EXPOSE 7000
ENTRYPOINT ["/bin/bash", "/app/start.sh"]
# Use the start script as the entry point
