# 1. Base image with Python 3.10
FROM python:3.10-slim

# 2. Install system dependencies: Tesseract (incl. Marathi & Hindi), FFmpeg, git-lfs, OpenCV prereqs
RUN apt-get update && apt-get install -y --no-install-recommends \
      build-essential \
      git-lfs \
      ffmpeg \
      tesseract-ocr \
      tesseract-ocr-eng \
      tesseract-ocr-hin \
      tesseract-ocr-mar \
      libleptonica-dev \
      pkg-config \
      poppler-utils \
    && rm -rf /var/lib/apt/lists/*

# 3. Install Poetry
RUN pip install --no-cache-dir poetry

# 4. Copy dependency manifests
WORKDIR /app
COPY pyproject.toml poetry.lock ./

# 5. Install Python deps (no root package)
RUN poetry config virtualenvs.create false \
  && poetry install --no-root --no-dev --no-interaction --no-ansi

# 6. Copy code
COPY . .

# 7. Default to invoking our stub CLI
ENTRYPOINT ["python3", "catalog.py"]
