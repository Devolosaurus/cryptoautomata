# cryptoautomata

A project using [Ollama](https://ollama.com/) for running large language models locally inside Docker.

## Requirements

- [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/)
- For NVIDIA GPU acceleration: [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html)
- For AMD GPU acceleration: [ROCm](https://rocm.docs.amd.com/)

## Usage

### CPU (default)

```bash
docker compose --profile default up -d
```

### NVIDIA GPU

```bash
docker compose --profile nvidia up -d
```

### AMD GPU (ROCm)

```bash
docker compose --profile amd up -d
```

### Pull a model

After the container is running, pull a model with:

```bash
docker exec cryptoautomata-ollama ollama pull llama3
```

### Access the API

The Ollama API is available at `http://localhost:11434`.

```bash
curl http://localhost:11434/api/tags
```

### Stop the service

```bash
docker compose down
```

To also remove stored models:

```bash
docker compose down -v
```

## Configuration

The following environment variables can be set in `docker-compose.yml`:

| Variable | Default | Description |
|---|---|---|
| `OLLAMA_KEEP_ALIVE` | `5m` | How long models stay loaded in memory |
| `OLLAMA_NUM_PARALLEL` | `1` (CPU) / `4` (GPU) | Number of parallel inference requests |
| `OLLAMA_MAX_LOADED_MODELS` | `1` | Maximum number of models loaded simultaneously |
| `OLLAMA_ORIGINS` | `*` | Allowed CORS origins for the API |
