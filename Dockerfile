FROM ollama/ollama:latest

# Expose the default Ollama API port
EXPOSE 11434

# Store models in a dedicated directory
VOLUME ["/root/.ollama"]

# Health check to verify Ollama is responsive
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
    CMD curl -f http://localhost:11434/api/tags || exit 1

ENTRYPOINT ["/bin/ollama"]
CMD ["serve"]
