FROM python:3.10-slim

WORKDIR /app

# Copy scripts into the container
COPY scripts/01_system_dependencies.sh .
COPY scripts/02_install_cuda.sh .
COPY scripts/03_install_cudnn.sh .
COPY scripts/04_install_python_deps.sh .
# COPY scripts/05_build_stockfish.sh .
# COPY scripts/06_download_lc0_weights.sh .
# COPY scripts/07_setup_bayeselo.sh .
# COPY scripts/08_run_data_downloads.sh .

# Ensure all scripts are executable
RUN chmod +x *.sh

# Run each step and test success afterward
RUN ./01_system_dependencies.sh

RUN ./02_install_cuda.sh && \
#    command -v nvcc || { echo "CUDA install failed: nvcc not found"; exit 1; }

RUN ./03_install_cudnn.sh && \
#    ldconfig -p | grep libcudnn || { echo "cuDNN install failed: libcudnn not found"; exit 1; }

RUN ./04_install_python_deps.sh && \
    python -c "import jax" || { echo "Python deps install failed: jax not importable"; exit 1; }

# RUN ./05_build_stockfish.sh && \
#     test -f /app/Stockfish/src/stockfish || { echo "Stockfish build failed: binary not found"; exit 1; }

# RUN ./06_download_lc0_weights.sh && \
#     test -f /app/lc0/build/release/768x15x24h-t82-swa-7464000.pb || { echo "Lc0 weights missing"; exit 1; }

# RUN ./07_setup_bayeselo.sh && \
#     test -f /app/BayesElo/bayeselo || { echo "BayesElo build failed: binary not found"; exit 1; }

# RUN ./08_run_data_downloads.sh && \
#     test -f /app/data/*.pgn && test -f /app/checkpoints/*.ckpt || echo "Warning: data/checkpoints may be incomplete"

CMD ["/bin/bash"]
