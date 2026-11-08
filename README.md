# Voice Clone Pipeline

> Open-source contribution: a lightweight, fully local voice cloning + lip-sync pipeline for content creators. No GPU required, no paid APIs — everything runs on CPU.

## About

This project packages a complete workflow for creating talking-head videos with a cloned voice:

1. **Voice cloning** — Record 10–60 seconds of clean speech, then synthesize any script in that voice.
2. **Lip-sync** — Take existing video footage and sync the lips to the newly generated narration.

Built for creators who want HeyGen-style avatar videos using only free, open-source models that are safe for monetized content (Apache-2.0 / MIT licensed).

## Components

| Stage | Model | Size | License |
|---|---|---|---|
| Voice cloning | Sopro TTS v2-turbo | 120M params | Apache-2.0 |
| Lip-sync | MuseTalk v1.5 | — | MIT |

- **Sopro TTS**: zero-shot voice cloning from 5–20s of reference audio, ~2x realtime on CPU.
- **MuseTalk**: audio-driven lip synchronization for existing video footage (single-step latent inpainting, no diffusion loop).

## Setup

```bash
python3 -m venv venv
source venv/bin/activate
pip install sopro
# MuseTalk setup: clone https://github.com/TMElyralab/MuseTalk and follow its README
```

## Usage

1. Add a reference voice: place a 10–60s clean WAV/MP3 (single speaker, no music, no background noise) in `voices/`
2. Synthesize narration:
   ```bash
   ./scripts/synthesize.sh --ref voices/my_voice.wav --out output.wav "Your script here"
   ```
3. Lip-sync: run MuseTalk inference with your source video + the generated `output.wav`

## Privacy note

Never commit personal voice recordings to a public repo — a voice sample lets anyone clone your voice. The `voices/` directory is git-ignored by default (only `.gitkeep` is tracked). Keep reference audio private.

## License

This pipeline's scripts and docs are MIT licensed. The underlying models keep their own licenses (Sopro: Apache-2.0, MuseTalk: MIT) — both permit commercial / monetized use.
